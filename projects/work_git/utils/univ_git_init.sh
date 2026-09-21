#!/usr/bin/env bash

CONFIG_FILE=".git_myconfig"

# 1а. Перевірка кількості параметрів
if [ "$#" -gt 2 ]; then
    echo "Помилка: забагато параметрів. Максимум 2."
    exit 1
fi

# 1а. Перевірка чи поточна директорія є репозиторієм (шукаємо тільки тут)
: 'if [ -d ".git" ]; then
    echo "Помилка: поточна директорія вже є Git-репозиторієм."
    exit 1
fi
'

# > /dev/null 2>&1 просто глушить весь вивід і помилки, щоб в термінал не сипався спам
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Помилка: поточна директорія вже є Git-репозиторієм."
    exit 1
fi



# 1б, 1в. Робота з файлом конфігурації
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Файл конфігурації $CONFIG_FILE не знайдено."
    read -p "Створити зараз? [y/n]: " choice
    if [ "$choice" != "y" ]; then
        echo "Роботу завершено."
        exit 1
    fi
    
    read -p "Введіть user.name: " USER_NAME
    read -p "Введіть user.email: " USER_EMAIL
    read -p "Введіть init.defaultBranch (напр. main): " USER_BRANCH
    
    echo "USER_NAME=\"$USER_NAME\"" > "$CONFIG_FILE"
    echo "USER_EMAIL=\"$USER_EMAIL\"" >> "$CONFIG_FILE"
    echo "USER_BRANCH=\"$USER_BRANCH\"" >> "$CONFIG_FILE"
    
    source "$CONFIG_FILE"
fi

# 2. Якщо 0 параметрів - довідка
if [ "$#" -eq 0 ]; then
    echo "Використання скрипту:"
    echo "./git_init.sh - довідка"
    echo "./git_init.sh <dir_name> - ініціалізація локального репо"
    echo "./git_init.sh <dir_name> <remote_url> - ініціалізація + remote"
    exit 0
fi

DIR_NAME="$1"
REMOTE_URL="$2"

# Створення директорії, якщо не існує
if [ ! -d "$DIR_NAME" ]; then
    mkdir "$DIR_NAME"
fi

cd "$DIR_NAME" || exit 1

HAS_GIT=0
[ -d ".git" ] && HAS_GIT=1
IS_EMPTY=1
[ "$(ls -A 2>/dev/null)" ] && IS_EMPTY=0

# 3. Якщо 1 параметр
if [ -z "$REMOTE_URL" ]; then
    if [ "$HAS_GIT" -eq 1 ] || [ "$IS_EMPTY" -eq 0 ]; then
        echo "Інфо: директорія $DIR_NAME вже є репозиторієм або не порожня."
        exit 0
    fi
    
    git init -b "$USER_BRANCH"
    git config --local user.name "$USER_NAME"
    git config --local user.email "$USER_EMAIL"
    echo "# $DIR_NAME" > README.md
    git add README.md
    git commit -m "Initial commit"
    echo "Локальний репозиторій успішно ініціалізовано."

# 4. Якщо 2 параметри
else
    if [ "$HAS_GIT" -eq 1 ]; then
        git remote add origin "$REMOTE_URL"
        echo "Remote репозиторій додано до існуючого."
    elif [ "$IS_EMPTY" -eq 0 ]; then
        echo "Помилка: директорія містить файли, але не є git репозиторієм."
        exit 1
    else
        git init -b "$USER_BRANCH"
        git config --local user.name "$USER_NAME"
        git config --local user.email "$USER_EMAIL"
        echo "# $DIR_NAME" > README.md
        git add README.md
        git commit -m "Initial commit"
        git remote add origin "$REMOTE_URL"
        echo "Репозиторій ініціалізовано та додано remote: $REMOTE_URL"
    fi
fi

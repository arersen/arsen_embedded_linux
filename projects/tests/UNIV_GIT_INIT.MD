# TEST

```
jambyl@jambyl-VirtualBox:~/arsen_embedded_linux/projects/tests$ ./test_univ_git_init.sh 
Файл конфігурації .git_myconfig не знайдено.
Створити зараз? [y/n]: y
Введіть user.name: ab
Введіть user.email: ad@a.a
Введіть init.defaultBranch (напр. main): main
Використання скрипту:
./git_init.sh - довідка
./git_init.sh <dir_name> - ініціалізація локального репо
./git_init.sh <dir_name> <remote_url> - ініціалізація + remote
Використання скрипту:
./git_init.sh - довідка
./git_init.sh <dir_name> - ініціалізація локального репо
./git_init.sh <dir_name> <remote_url> - ініціалізація + remote
Initialized empty Git repository in /home/jambyl/arsen_embedded_linux/projects/test_dir_1/.git/
[main (root-commit) ca5897e] Initial commit
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
Локальний репозиторій успішно ініціалізовано.
total 16
drwxrwxr-x 3 jambyl jambyl 4096 Sep 16 21:21 .
drwxrwxr-x 7 jambyl jambyl 4096 Sep 16 21:21 ..
drwxrwxr-x 7 jambyl jambyl 4096 Sep 16 21:21 .git
-rw-rw-r-- 1 jambyl jambyl   13 Sep 16 21:21 README.md
# test_dir_1
Інфо: директорія test_dir_1 вже є репозиторієм або не порожня.
Initialized empty Git repository in /home/jambyl/arsen_embedded_linux/projects/test_dir_2/.git/
[main (root-commit) 9a99997] Initial commit
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
Репозиторій ініціалізовано та додано remote: https://github.com/user/test.git
origin	https://github.com/user/test.git (fetch)
origin	https://github.com/user/test.git (push)
Помилка: забагато параметрів. Максимум 2.
mkdir: test_dir_3: File exists
Інфо: директорія test_dir_3 вже є репозиторієм або не порожня.
jambyl@jambyl-VirtualBox:~/arsen_embedded_linux/projects/tests$ 
```

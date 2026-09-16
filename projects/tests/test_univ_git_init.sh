cd ..
rm -f .git_myconfig

./work_git/utils/univ_git_init.sh

./work_git/utils/univ_git_init.sh

./work_git/utils/univ_git_init.sh test_dir_1

ls -la test_dir_1

cat test_dir_1/README.md

./work_git/utils/univ_git_init.sh test_dir_1

./work_git/utils/univ_git_init.sh test_dir_2 https://github.com/user/test.git

cd test_dir_2

git remote -v

cd ..

./work_git/utils/univ_git_init.sh 1 2 3

mkdir test_dir_3

touch test_dir_3/file.txt

./work_git/utils/univ_git_init.sh test_dir_3

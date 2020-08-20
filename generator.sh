#/bin/bash
if [ $# -eq 0 ];then 
    flutter packages pub run build_runner build
elif [ $1 = 'bulid' ] || [ $1 = 'watch' ]; then
    flutter packages pub run build_runner $1
else
    echo 'Usage: ./generator.sh [build|watch]'
fi 
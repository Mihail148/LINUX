#!/bin/bash

read -p "Введите путь к директории: " DIRCLEANER

if [ -e $DIRCLEANER ]
        then
                echo 'Директория найдена'
                cd $DIRCLEANER
                echo 'Идет удаление'
                rm -v *.bak *.tmp *.backup
                echo 'Удаление завершено'
        else
                echo 'Директория не найдена! Останавливаем работу'
                exit 2
fi              

# LINUX

## Домашнее задание № 1
Перед тем как работать с файлами создадим новую директорию при помощи команды:
```
mikevb@mike-vb:~$ mkdir homework
```

## После мы используем следующую команду для создания файлов и заполняем их случайными символами:
```
mikevb@mike-vb:~$ cat > file1
aghio[rga
apgrhauer
aprghi
```

## После мы копируем составляющее file1 в file2 при помощи команды:
```
mikevb@mike-vb:~$ cat file2
aghio[rga
apgrhauer
aprghi
```

## Создаем символическую ссылку file3 на file1:
```
mikevb@mike-vb:~$ ln -s file1 file3
```

## Создаем жесткую ссылку file4 на file1:
```
mikevb@mike-vb:~$ ln file1 file4
```

## Смотрим какие айноды у наших файлов:
```
mikevb@mike-vb:~$ ls -li
итого 92
1442192 -rw-rw-r-- 2 mikevb mikevb    32 июн 25 19:25  file1
1442261 -rw-rw-r-- 1 mikevb mikevb    32 июн 25 19:27  file2
1442277 lrwxrwxrwx 1 mikevb mikevb     5 июн 25 19:29  file3 -> file1
1442192 -rw-rw-r-- 2 mikevb mikevb    32 июн 25 19:25  file4
1442176 drwxrwxr-x 2 mikevb mikevb  4096 июн 25 19:23  homework
      1 drwxrwx--- 1 root   vboxsf 40960 июн 19 22:04  shared
1441891 drwx------ 3 mikevb mikevb  4096 июн 20 13:17  snap
1441829 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Видео
1441826 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Документы
1441823 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Загрузки
1441828 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Изображения
1441827 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Музыка
1441825 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Общедоступные
1441822 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17 'Рабочий стол'
1441824 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Шаблоны
```

## Удаляем file1:
```
mikevb@mike-vb:~$ rm file1
```

## Дальше снова смотрим что произошло с остальными файлами:
```
mikevb@mike-vb:~$ ls -li
итого 88
1442261 -rw-rw-r-- 1 mikevb mikevb    32 июн 25 19:27  file2
1442277 lrwxrwxrwx 1 mikevb mikevb     5 июн 25 19:29  file3 -> file1
1442192 -rw-rw-r-- 1 mikevb mikevb    32 июн 25 19:25  file4
1442176 drwxrwxr-x 2 mikevb mikevb  4096 июн 25 19:23  homework
      1 drwxrwx--- 1 root   vboxsf 40960 июн 19 22:04  shared
1441891 drwx------ 3 mikevb mikevb  4096 июн 20 13:17  snap
1441829 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Видео
1441826 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Документы
1441823 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Загрузки
1441828 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Изображения
1441827 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Музыка
1441825 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Общедоступные
1441822 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17 'Рабочий стол'
1441824 drwxr-xr-x 2 mikevb mikevb  4096 июн 20 13:17  Шаблоны
```
file2 - остался без изменений
file3 -> file1 - стал выделятся красным
file4 - остался без изменений

## Выводим на экран наши файлы:
Для file2:
```
mikevb@mike-vb:~$ cat file2
aghio[rga
apgrhauer
aprghi
```
Для file3:
```
mikevb@mike-vb:~$ cat file3
cat: file3: Нет такого файла или каталога
```
Для file4:
```
mikevb@mike-vb:~$ cat file4
aghio[rga
apgrhauer
aprghi
```

## Даем новые имена созданным файлам:
```
mikevb@mike-vb:~$ mv file2 new_file2
mikevb@mike-vb:~$ mv file3 new_file3
mikevb@mike-vb:~$ mv file4 new_file4
```

## Создаем новую символическую ссылку:
```
mikevb@mike-vb:~$ ln -s new_file2 file2_link
```

## Переносим ссылки в новую директорию:
```
mikevb@mike-vb:~$ mv file2_link /homework/
mikevb@mike-vb:~$ mv new_file3 /homework/
mikevb@mike-vb:~$ mv new_file4 /homework/
```

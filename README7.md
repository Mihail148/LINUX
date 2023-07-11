# Задание.
1. Установить Nginx и настроить его на работу с PHP-FPM.
2. Установить Apache. Настроить обработку PHP. Добиться одновременной работы с Nginx.
3. Настроить схему обратного прокси для Nginx (динамика - на Apache).
4. Установить MySQL. Создать новую базу данных и таблицу в ней.
5. **Установить пакет phpmyadmin и запустить его веб-интерфейс для управления MySQL.
6. **Настроить схему балансировки трафика между несколькими серверами Apache
на стороне Nginx с помощью модуля ngx_http_upstream_module.


## Установить Nginx и настроить его на работу с PHP-FPM.

1. Установить Nginx
```
sudo apt install nginx
```

2. Установить PHP-FPM
```
sudo apt install php-fpm
```

3. Настроить Nginx на работу с PHP-FPM

Перейдем в каталог с файлами
```
cd /etc/nginx/sites-available
```

Создадим свой конфиг файлов
```
sudo touch project.local
```

Отредактируем его в редакторе
```
sudo nano project.local
```

Дальше пропишем конфиг для него
```
server {
     listen 80; # порт, прослушивающий nginx
     server_name    project.local; # доменное имя, относящиеся к текущему виртуальному хосту
     root  /home/stavanger/code/project.local; # каталог в котором лежит проект, путь к точке входа


     index index.php;
     # add_header Access-Control-Allow-Origin *;


     # serve static files directly
     location ~* \.(jpg|jpeg|gif|css|png|js|ico|html)$ {
             access_log off;
             expires max;
             log_not_found off;
     }


     location / {
             # add_header Access-Control-Allow-Origin *;
             try_files $uri $uri/ /index.php?$query_string;
     }

     location ~* \.php$ {
     try_files $uri = 404;
     fastcgi_split_path_info ^(.+\.php)(/.+)$;
     fastcgi_pass unix:/var/run/php/php8.1-fpm.sock; # подключаем сокет php-fpm
     fastcgi_index index.php;
     fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
     include fastcgi_params;
 }

 location ~ /\.ht {
             deny all;
     }
}
```
После добавления сохраняем и выходим из редактора

Теперь активируем наш конфиг файл в каталоге /etc/nginx/sites-enabled/:
```
cd /etc/nginx/sites-enabled/
```
Далее нам нужен  /etc/hosts:
```
sudo nano /etc/hosts
```
Там нам нужно заменить/добавить строку:
```
127.0.0.1    project.local
```
Запускаем php-fpm:
```
sudo service php8.1-fpm start
```

## Установить Apache. Настроить обработку PHP. Добиться одновременной работы с Nginx.
Установить Apache2:
```
sudo apt install apache2
```
Настроить обработку PHP:
```
sudo apt install libapache2-mod-php8.1
```
Добиться одновременной работы с Nginx:
   Для этого надо поменять порт Apache на котором он сидит, для этого открываем файл конфига:
    ```
    sudo nano /etc/apache2/ports.conf
    ```
И тут меняем строку Listen, порт 8888 для примера, можно любой свободный:
```
Listen 8888
```
## Настроить схему обратного прокси для Nginx (динамика - на Apache).











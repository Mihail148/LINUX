# Задание:

## 1. Подключить дополнительный репозиторий на выбор: Docker, Nginx, Oracle MySQL. Установить любой пакет из этого репозитория.
Установить любой пакет из этого репозитория.
```
https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
 sudo apt update
 sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -m 0755 -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install gimp
```

## 2. Установить и удалить deb-пакет с помощью dpkg.
```
sudo dpkg -i /shared/ubuntu/virtualbox-7.0_7.0.6-155176_Ubuntu_jammy_amd64.deb
sudo apt -f install
```
Удаление
```
sudo apt purge virtualbox-7.0
sudo apt autoremove
```

## 3. Установить и удалить snap-пакет.
```
snap --help
sudo snap find postgresql
htop - программа мониторинга нагрзки 
sudo snap find htop - найти версии
 sudo snap install htop

sudo snap remove htop - удаление

htop
```

## 4. Добавить задачу для выполнения каждые 3 минуты (создание директории, запись в файл).
```
crontab --help

crontab -e
* * * * * mkdir /tmp/test && date > /tmp/test/date.txt
```
Удаление
```
crontab -r -i
```

## 5. * Подключить PPA-репозиторий на выбор. Установить из него пакет. Удалить PPA из системы.
```
https://launchpad.net/~ondrej/+archive/ubuntu/php
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install gimp

sudo rm -v /etc/apt/sources.list.d/ondrej-ubuntu-php-jammy.list

sudo apt update
```
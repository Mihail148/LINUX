# Задание
Создать два произвольных файла. Первому присвоить права на чтение и запись для владельца и группы, только на чтение — для всех. Второму присвоить права на чтение и запись только для владельца. Сделать это в численном и символьном виде.
Назначить новых владельца и группу для директории целиком.

## Управление пользователями:

1. Создать пользователя, используя утилиту useradd и adduser:
```
mikevb@mike-vb:~$ sudo useradd -s /bin/bash -d /home/user1 -m user1
[sudo] пароль для mikevb:
mikevb@mike-vb:~$
```
Проверка результата:
```
mikevb@mike-vb:~$ sed 's/:.*//' /etc/passwd
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data
backup
list
irc
gnats
nobody
systemd-network
systemd-resolve
messagebus
systemd-timesync
syslog
_apt
tss
uuidd
systemd-oom
tcpdump
avahi-autoipd
usbmux
dnsmasq
kernoops
avahi
cups-pk-helper
rtkit
whoopsie
sssd
speech-dispatcher
fwupd-refresh
nm-openvpn
saned
colord
geoclue
pulse
gnome-initial-setup
hplip
gdm
mikevb
sshd
vboxadd
user1
```

2. Удалить пользователя, используя утилиту userdel:
```
mikevb@mike-vb:~$ killall -9 -u user1
mikevb@mike-vb:~$ sudo userdel --remove user1
userdel: почтовый ящик user1 (/var/mail/user1) не найден
```
Проверка результата:
```
mikevb@mike-vb:~$ sed 's/:.*//' /etc/passwd
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data
backup
list
irc
gnats
nobody
systemd-network
systemd-resolve
messagebus
systemd-timesync
syslog
_apt
tss
uuidd
systemd-oom
tcpdump
avahi-autoipd
usbmux
dnsmasq
kernoops
avahi
cups-pk-helper
rtkit
whoopsie
sssd
speech-dispatcher
fwupd-refresh
nm-openvpn
saned
colord
geoclue
pulse
gnome-initial-setup
hplip
gdm
mikevb
sshd
vboxadd
```

## Управление группами:

1. Создать группу с использованием утилит groupadd и addgroup:
```
mikevb@mike-vb:~$ sudo groupadd group1
mikevb@mike-vb:~$ sudo groupadd group2
```

Проверка результата:
```
mikevb@mike-vb:~$ sed 's/:.*//' /etc/group
root
daemon
bin
sys
adm
tty
disk
lp
mail
news
uucp
man
proxy
kmem
dialout
fax
voice
cdrom
floppy
tape
sudo
audio
dip
www-data
backup
operator
list
irc
src
gnats
shadow
utmp
video
sasl
plugdev
staff
games
users
nogroup
systemd-journal
systemd-network
systemd-resolve
crontab
messagebus
systemd-timesync
input
sgx
kvm
render
syslog
tss
bluetooth
ssl-cert
uuidd
systemd-oom
tcpdump
_ssh
avahi-autoipd
netdev
avahi
lpadmin
rtkit
whoopsie
sssd
fwupd-refresh
nm-openvpn
scanner
saned
colord
geoclue
pulse
pulse-access
gdm
lxd
mikevb
sambashare
vboxsf
vboxdrmipc
group1
group2
```

2. Попрактиковаться в смене групп у пользователей:
```
mikevb@mike-vb:~$ sudo adduser user4
Добавляется пользователь «user4» ...
Добавляется новая группа «user4» (1003) ...
Добавляется новый пользователь «user4» (1001) в группу «user4» ...
Создаётся домашний каталог «/home/user4» ...
Копирование файлов из «/etc/skel» ...
Новый пароль:
НЕУДАЧНЫЙ ПАРОЛЬ: Пароль должен содержать не менее 8 символов
Повторите ввод нового пароля:
Извините, но пароли не совпадают.
Новый пароль:
НЕУДАЧНЫЙ ПАРОЛЬ: Пароль является палиндромом
Повторите ввод нового пароля:
Извините, но пароли не совпадают.
Новый пароль:
НЕУДАЧНЫЙ ПАРОЛЬ: Пароль должен содержать не менее 8 символов
Повторите ввод нового пароля:
passwd: пароль успешно обновлён
Изменение информации о пользователе user4
Введите новое значение или нажмите ENTER для выбора значения по умолчанию
        Полное имя []:
        Номер комнаты []:
        Рабочий телефон []:
        Домашний телефон []:
        Другое []:
Данная информация корректна? [Y/n] y
```

```
mikevb@mike-vb:~$ groups user4
user4 : user4
```

```
mikevb@mike-vb:~$ sudo usermod -g group1 user4
mikevb@mike-vb:~$ groups user4
user4 : group1
```

```
mikevb@mike-vb:~$ sudo vim /etc/group
```

```
mikevb@mike-vb:~$ groups user4
user4 : group1 group3
```

3. Добавить пользователя в группу, не меняя основной:
```
mikevb@mike-vb:~$ sudo usermod -G group2 user4
mikevb@mike-vb:~$ groups user4
user4 : group1 group2
```

4. Удалить пользователя из группы:
```
mikevb@mike-vb:~$ sudo deluser user4 group2
Удаляется пользователь «user4» из группы «group2» ...
Готово.
mikevb@mike-vb:~$ groups user4
user4 : group1
```

## Создать пользователя с правами суперпользователя. Сделать так, чтобы sudo не требовал пароль для выполнения команд.
```
mikevb@mike-vb:~$ sudo useradd -g sudo super_user
mikevb@mike-vb:~$ groups super_user
super_user : sudo
```
```
mikevb@mike-vb:~$ sudo visudo
```

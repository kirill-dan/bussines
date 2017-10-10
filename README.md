Проект Bussines (чистая базовая сборка)
========

A Symfony project created on August 3, 2017, 2:44 pm.

Для работы с проектом в режиме разработки, необходимо в папке со своими проектами (например, /home/user/projects), создать новую папку: bussines

Должно получится так: /home/user/projects/bussines

Теперь в эту папку необходимо скопировать два репозитория. Репозиторий с docker и репозиторий с проектом:

git clone git@github.com:kirill-dan/docker.git

Должно получится так: /home/user/projects/bussines/docker

git clone git@github.com:kirill-dan/bussines.git

Должно получится так: /home/user/projects/bussines/bussines

Теперь переименовываем папку bussines в папку project

Должно получится так: /home/user/projects/bussines/project

Теперь докер при старте будет успешно видеть наш симфони проект.

В файле настроек app/config/parameters.yml меняем параметры по умолчанию на:
```
parameters:
    database_host: postrgesql
    database_port: 5432
    database_name: bussines
    database_user: docker
    database_password: docker
```
В файле app/config/config.yml устанавливаем драйвер базы данных PostgreSQL:
```
# Doctrine Configuration
doctrine:
    dbal:
        driver: pdo_pgsql
```        
Теперь, когда база данных сконфигурирована, запускаем из папки docker файл init_db.sh, который создаст нашу базу данных.

Так как docker для базы настроен таким образом, что все данные базы будут сохранятся на ваш компьютер, то можно не беспокоится о том, 
что данные пропадут после уничтожения контейнера.

Для удобства работы с БД можно установить pgadmin4. Инструкция по установке и настройке находится в папке docker.

После того, как вы все настроите, необходимо выполнить команду: 
```
composer install
composer update
```

После выполнения первой комманды, будут установлены все пакеты, после второй - обновлены на свежие версии.

Сайт будет в итоге доступен по адресу:
```
http://bussines.dev/app_dev.php
```
app_dev.php - это файл для окружения разработки

Админка находится по адресу:
```
http://bussines.dev/app_dev.php/admin/
```
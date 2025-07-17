# InstaMini 📸

Минималистичный клон Instagram, реализованный на Ruby on Rails.  
Поддерживает регистрацию пользователей, создание постов с изображениями и комментарии.

## 🚀 Стек технологий

- Ruby 3.x
- Ruby on Rails 7.x
- PostgreSQL
- Devise (аутентификация)
- Tailwind CSS (оформление)
- Active Storage (загрузка изображений)


## ⚙️ Установка и запуск

### 1. Клонировать репозиторий

git clone https://github.com/ShinMothra/Insta_Mini.git
cd Insta_Mini

### 2. Установить зависимости

bundle install
yarn install

### 3. Настроить базу данных

rails db:create
rails db:migrate

### 4. Запустить сервер

rails server

Приложение будет доступно по адресу:
http://localhost:3000

## 📂 Основные возможности

* Регистрация и вход пользователей (Devise)
* Подписки и отписки
* Лайки
* Создание постов с изображениями
* Комментирование постов

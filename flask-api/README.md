# Flask API с CI/CD через Jenkins и Docker


## 📌 Описание проекта

REST API на Flask для отправки и получения результатов.  
Проект контейнеризован с помощью Docker и автоматизирован с использованием Jenkins CI/CD.

---

## 🛠️ Стек технологий

- Python 3.11 + Flask  
- PostgreSQL (через Docker)  
- Docker и Docker Compose  
- Jenkins (Pipeline)  
- Flake8 (линтинг)

---

## 📁 Структура проекта
Эндпоинт http://localhost:5000/results
flask-api/
├── app/
│ ├── init.py
│ ├── models.py
│ └── routes.py
├── create_tables.py
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── .env.example
├── requirements.txt
└── README.md


---

## 🚀 Быстрый старт

### 1. Клонирование репозитория

```bash
git clone https://github.com/picard2104/DevOps_Kit.git
cd DevOps_Kit/flask-api
sudo vim .env
POSTGRES_DB=user
POSTGRES_USER=user
POSTGRES_PASSWORD=1111111
FLASK_APP=app/routes.py
Отредактируйте .env, если необходимо.

2. Запуск локально через Docker Compose
docker-compose up --build -d
Инициализация базы данных:

docker-compose exec web python create_tables.py
3. Проверка API
Проверка доступности:

curl http://localhost:5000/ping
Отправка результата:

curl -X POST http://localhost:5000/submit \
     -H "Content-Type: application/json" \
     -d '{"name": "Kirill", "score": 88}'
Получение всех результатов:

curl http://localhost:5000/results
⚙️ Настройка Jenkins CI/CD
Требования
Jenkins установлен (рекомендуется Ubuntu)
Docker и Docker Compose на Jenkins-агенте и удалённом сервере
Docker Hub аккаунт
SSH-доступ к удалённому серверу
Установка Jenkins (Ubuntu)
sudo apt update
sudo apt install -y openjdk-21-jre
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo ufw allow 8080 #если закрыт порт
Настройка Pipeline
Создайте новый Pipeline job в Jenkins.
Укажите репозиторий и ветку main.
В разделе Pipeline выберите Pipeline script from SCM и путь к Jenkinsfile.
Добавьте Jenkins Credentials:
Docker Hub (username/password)
SSH ключ для удалённого сервера
Git user/password
.env файл с секретами
🔁 Как работает CI/CD
Jenkins Pipeline выполняет:

Клонирование кода из GitHub
Сборку Docker-образа
Линтинг кода с flake8
Публикацию образа в Docker Hub
Копирование .env и docker-compose.yml на сервер
Перезапуск контейнеров на удалённой машине
🔐 Переменные окружения (.env)
Пример:

POSTGRES_DB=user
POSTGRES_USER=user
POSTGRES_PASSWORD=1111111
FLASK_ENV=development
SECRET_KEY=your_secret_key
🧪 Полезные команды
Запуск контейнеров:

docker-compose up --build -d
Инициализация БД:

docker-compose exec web python create_tables.py
Остановка контейнеров:

docker-compose down
Просмотр логов:

docker-compose logs -f

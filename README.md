# 📚 Book Library

A simple book borrowing and management system built with **Ruby on Rails**.

## 🚀 Features
- User authentication (Devise)
- Add new books
- Borrow and return books
- User profile with borrowed books
- Responsive UI with Tailwind CSS

## 🛠️ Technologies Used
- **Backend:** Ruby on Rails
- **Frontend:** ERB + Tailwind CSS
- **Database:** PostgreSQL
- **Authentication:** Devise
- **Deployment:** Docker, Kamal

## 📦 Installation & Setup

### Prerequisites
Make sure you have the following installed:
- **Ruby**
- **Rails** (
- **PostgreSQL**
- **Bundler**
- **Docker (optional for deployment)**

### Clone the Repository
```sh
git clone git@github.com:kipkirui63/Book_library.git
cd Book_library
```

### Install Dependencies
```sh
bundle install
```

### Set Up the Database
```sh
rails db:create db:migrate db:seed
```

### Start the Server
```sh
rails server
```
Visit `http://localhost:3000` to view the app.

## 📖 Usage
- Sign up or log in
- Browse available books
- Click **"Borrow"** to borrow a book
- View borrowed books in your profile
- Return books when done

## 🐳 Docker Setup (Optional)
```sh
docker-compose up --build
```

## 🏗️ Deployment with Kamal
```sh
kamal deploy
```

## 🔥 Contributing
Feel free to submit issues and pull requests.

## 📜 License
MIT License. See [LICENSE](LICENSE) for details.


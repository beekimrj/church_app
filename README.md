# Church Attendance Management (Rails)

A simple **Church Attendance Management System** built with **Ruby on Rails**.
The primary goal of this project is to manage church members and track attendance for various church services and events.

The system allows administrators to:

- Manage **Church Services** (e.g. Sunday Service, Sunday School, Men's Fellowship)
- Create **Events** under each service
- Record **Attendances** for each event on specific dates
- Track **Member attendance** with arrival and departure times

The application is designed to be **simple, flexible, and extensible**, allowing additional features such as reporting, check-in systems, or event management to be added later.

---

# Tech Stack

- **Ruby on Rails 8**
- **PostgreSQL**
- **Hotwire (Turbo + Stimulus)**
- **Slim templates**
- **Kaminari** for pagination
- **RSpec** for testing

Other supporting gems include:

- dotenv
- annotate
- rubocop
- brakeman
- factory_bot
- faker (test usage)

---

# Requirements

Before running the project locally, ensure you have installed:
- Ruby: 3.3.x
- Rails: 8.0.x
- PostgreSQL: 14+
- Node.js: 18+
- Yarn: 1.22+

---

# Setup Instructions

## 1. Clone the repository

```
git clone https://github.com/beekimrj/church_app
cd church_app
```

## 2. Install dependencies
```
bundle install
```

## 3. Setup environment variables
A sample environment file is included.

```
cp sample.env .env
```

Edit .env and update the database connection if necessary.
```
DATABASE_URL=postgres://username:password@localhost:5432
```

## 4. Setup the database

Create the database:
```
rails db:create
```

Run migrations:
```
rails db:migrate
```

## 5. Seed sample data

The project includes seed data for:
- Church Services
- Events
- Attendances
- Members
- Attendance records

Run:
```
rails db:seed
```

## 6. Start the Rails server
Run:
```
rails server
```
Then open following url in browser:

http://localhost:3000

#### Running Tests
The project uses RSpec.

Run all tests:
```
bundle exec rspec
```

---
# Useful Development Commands

Reset database:
```
rails db:reset
```

Annotate models:
```
bundle exec annotate
```

Run security scan:
```
bundle exec brakeman
```
---

# Future Improvements
## Possible future enhancements:
- Member check-in interface
- QR or code-based check-in
- Attendance reports
- Event recurrence automation
- Role-based access control
- API support

---

# Setup in Windows
For project setup, please follow the following steps:
1. Install WSL in windows,
     - Reference: https://www.youtube.com/watch?v=_Axukb6W_Dk
2. Install rbenv [recommended] in WSL or you can also use RVM.
     - Reference: https://dev.to/jessalejo/installing-ruby-using-rbenv-on-your-wsl-ubuntu-system-183f
3. install nvm (node version manager, manages nodes) in wsl,
    - Reference: https://dev.to/pu-lazydev/setting-up-nvm-nodejs-and-yarn-on-wsl-ubuntu-50bg
4. Setup VScode so that it can work with WSL
     - Reference:: https://code.visualstudio.com/docs/remote/wsl
5. Git should be installed by default in wsl, if not, install and setup git.
6. Install postgres (psql) database in WSL
     - Reference: https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-database#install-postgresql
7. Clone Church project repo from github: https://github.com/beekimrj/church_app
8. Read ReadMe file in project to setup (I will update this shortly)

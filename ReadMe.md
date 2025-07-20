# E-Sports Match Tracker

A mini full-stack application for tracking upcoming e-sports matches. Built with **React.js** on the frontend and **C# (.NET Core Web API)** on the backend, with a simulated external API and logging to a database (Azure SQL or local SQL Server).

---

## 📦 Features

- Responsive React UI to display upcoming matches
- .NET Core backend API that fetches match data from a mock external source
- Match API call logging to a SQL database
- Optimized with in-memory caching (5-minute window)
- Clean, modular architecture and code

---

## 🔧 Tech Stack

- **Frontend:** React.js
- **Backend:** C# (.NET 6+ Web API), MemoryCache, Entity Framework Core
- **Database:** SQL Server/SQLite (local setup supported)
- **API Simulation:** Local `matches.json` file
- **Containerization:** Docker & Docker Compose

---

## 🚀 Project Setup

### Prerequisites

- Git
- Docker & Docker Compose
- Node.js (for local development)
- .NET 6+ SDK (for local development)

### 1. Clone the Project with Submodules

This project contains git submodules for the frontend and backend components. Clone the repository with all submodules:

```bash
# Clone the main repository with all submodules
git clone --recursive https://github.com/codemachine0121/esports-match-tracker.git

# Or if you already cloned without --recursive, initialize submodules:
git submodule update --init --recursive
```

### 2. Docker Compose Setup (Recommended)

Run the script `start_project.sh`

- docker image build
- docker-compose up
- dotnet database migration
- insert mock data

This will start:

- **Frontend**: Available at `http://localhost:3000`
- **Backend API**: Available at `http://localhost:5000`
- **Database**: SQL Server running on port `1433`

To stop all services:

```bash
docker-compose down
```

### 3. Local Development Setup

#### Backend Setup:

```bash
# Navigate to the backend directory
cd backend

# Restore dependencies
dotnet restore

# Run database migrations (if applicable)
dotnet ef database update

# Start the API
dotnet run
```

#### Frontend Setup:

```bash
# Navigate to the frontend directory
cd frontend

# Install dependencies
npm install

# Start the React development server
npm start
```

---

## 🐳 Docker Commands

Useful Docker Compose commands for development:

```bash
# View running containers
docker-compose ps

# View logs for all services
docker-compose logs

# View logs for a specific service
docker-compose logs frontend
docker-compose logs backend

# Rebuild and restart a specific service
docker-compose up --build frontend

# Stop and remove all containers, networks, and volumes
docker-compose down -

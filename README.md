# Ordify Backend (Plug & Play)

## Prerequisites
- Docker
- Docker Compose

## How to Run

1. Clone the repository
```bash
git clone <repo-url>
cd ordify-backend
Have to add .env.dev file, due to security reason not commited

    Build & run using Docker Compose

docker compose up

    Access the application

    Backend: http://localhost:8080

    APIs: /delivery, /order, etc.

Demo Data

Demo data is auto-loaded on first startup using SQL scripts.

To reset demo data:

docker compose down -v
docker compose up

Stop the application

docker compose down


---

# 8️⃣ How OTHERS will use your repo (exact flow)

They will do:

```bash
git clone your-repo
cd ordify-backend
docker compose up
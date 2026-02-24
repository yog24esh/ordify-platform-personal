# Ordify Backend – Docker & Kubernetes Deployment

This repository contains the **Spring Boot backend** for the Ordify platform (Delivery module focus), fully containerized and deployed using **Docker, Docker Compose, AWS EC2, and Kubernetes (Minikube)**.

The project is designed to be **plug-and-play**, allowing anyone to run it locally or deploy it with minimal setup.

---

## 🚀 Tech Stack

- **Backend**: Spring Boot (Java 17)
- **Database**: MySQL 8
- **Migrations**: Flyway
- **Containerization**: Docker, Docker Compose
- **Cloud**: AWS EC2
- **Orchestration**: Kubernetes (Minikube)
- **Build Tool**: Maven

---

## 📁 Project Structure

ordify-backend/  
├── src/ # Spring Boot source code  
├── Dockerfile # Backend Docker image  
├── docker-compose.yml # Local Docker Compose setup  
├── k8s/ # Kubernetes manifests  
│ ├── mysql-deployment.yaml  
│ ├── mysql-service.yaml  
│ ├── backend-deployment.yaml  
│ └── backend-service.yaml  
├── pom.xml  
└── README.md  



## ⚙️ Configuration

The application uses **environment variables** for configuration.

Defaults are defined in `application.yaml`, so **no `.env` file is required** when using Docker or Kubernetes.

### Environment Variables

| Variable | Description |
|--------|-------------|
| `DB_URL` | MySQL JDBC URL |
| `DB_USER` | Database username |
| `DB_PASS` | Database password |

These are injected via:
- Docker Compose (local / EC2)
- Kubernetes manifests (Minikube)


## 🐳 Run Locally with Docker Compose (Recommended First)

### Prerequisites
- Docker
- Docker Compose

### Steps

bash  
git clone https://github.com/yog24esh/ordify-backend-personal.git  
cd ordify-backend  
docker-compose up  

Access API  

http://localhost:8080/delivery  

✔ MySQL schema is created automatically  
✔ Demo data is loaded via Flyway  
✔ Backend starts without manual DB setup  



### ☁️ Deploy on AWS EC2 (Docker)  
High-level steps  

    Launch an Amazon Linux 2 EC2 instance  

    Install:  

        Docker  

        Docker Compose  

        Java 17  

        Maven  

    Clone this repository on EC2  

    Build and run:  

mvn clean package -DskipTests  
docker-compose up -d --build  

Access API  

http://13.232.2.165:8080/delivery  

APIs-
1. http://13.232.2.165:8080/api/products/1
2. http://13.232.2.165:8080/api/darkstores/1
3. http://13.232.2.165:8080/api/inventory/1

💡 Stop the EC2 instance when not in use to control cost.  



### ☸️ Run on Kubernetes (Minikube)  

This project is also deployed on Kubernetes for orchestration learning and demonstration.  
Prerequisites  

    Docker Desktop  

    kubectl  

    Minikube  

Start Minikube  

minikube start  
kubectl get nodes  

Build Docker image inside Minikube  

eval $(minikube docker-env)  
docker build -t ordify-backend:1.0 .  

Deploy to Kubernetes  

cd k8s  
kubectl apply -f .  

Verify:  

kubectl get pods  
kubectl get services  

Access the application  

minikube service ordify-backend  

Then test:  

/delivery  

✔ Backend and MySQL run as separate pods  
✔ Services enable inter-pod communication  
✔ API tested successfully on Kubernetes  
🧪 Demo Data  

    Database schema and demo records are managed using Flyway  

    Demo data loads automatically on startup  

    No manual SQL execution required  

### 🛑 Stopping Services  
Docker Compose  

docker-compose down  

Kubernetes  

minikube stop  

AWS EC2  

Stop the EC2 instance from AWS Console to avoid charges.  
🎯 Key Learnings & Highlights

    Dockerized Spring Boot + MySQL backend

    Environment-based configuration

    Flyway-managed schema & demo data

    AWS EC2 deployment with cost awareness

    Kubernetes deployments & services

    Debugging real-world issues (image pull, startup order, Maven versions)

### 📌 Future Improvements  

    ConfigMaps & Secrets for Kubernetes

    Persistent Volumes for MySQL

    Health probes & scaling

    AWS EKS deployment

    CI/CD pipeline

### 👤 Author

Developed as part of a group project (Ordify Platform).
Dockerization, cloud deployment, and Kubernetes setup implemented independently for learning and demonstration purposes.

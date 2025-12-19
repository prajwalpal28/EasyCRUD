# EasyCRUD – Full Stack Deployment on AWS (EKS + Terraform)

## 📌 Project Overview

EasyCRUD is a full-stack CRUD application deployed on AWS using **modern DevOps tools**.
It demonstrates how to deploy a **React frontend**, **Spring Boot backend**, and **MariaDB database** using **Docker, Kubernetes (EKS), Terraform, and AWS services**.

This project is designed for **real-world DevOps / Cloud learning** and is fully interview-ready.

---

## 🏗️ Architecture Diagram (Logical View)

```
User Browser
     |
     |  HTTP
     v
React Frontend (S3 Static Hosting)
     |
     |  REST API Calls (/api/*)
     v
AWS Application Load Balancer (Ingress)
     |
     v
EKS Cluster (Kubernetes)
 ┌──────────────────────────────┐
 │ Backend Pod (Spring Boot)    │
 │   - REST APIs                │
 │   - JPA / Hibernate          │
 └──────────────┬───────────────┘
                |
                v
        MariaDB Pod (K8s)
        - student_db
        - Persistent Volume
```

---

## 🧰 Tech Stack

### Frontend

* React (Vite)
* HTML, CSS, JavaScript
* Hosted on **AWS S3 (Static Website Hosting)**

### Backend

* Java 17
* Spring Boot 3.x
* Spring Data JPA
* REST APIs
* Dockerized

### Database

* MariaDB
* Kubernetes Stateful Pod

### DevOps / Cloud

* AWS EKS (Kubernetes)
* AWS EC2, VPC, IAM
* AWS ALB (Ingress)
* AWS S3
* Terraform (Infrastructure as Code)
* Docker
* kubectl, eksctl, Helm

---

## 📁 Repository Structure

```
EasyCRUD/
├── frontend/               # React frontend
│   ├── dist/               # Production build
│   └── .env                # Backend API URL
├── backend/                # Spring Boot backend
│   ├── Dockerfile
│   └── src/
├── terraform/              # AWS Infra (EKS, VPC, IAM)
├── mariadb-deployment.yaml # MariaDB Kubernetes manifest
└── README.md
```

---

## 🌐 Deployed URLs

### Frontend URL

```
http://easycrud-frontend-733366527969.s3-website.us-east-2.amazonaws.com
```

### Backend (via ALB)

```
http://<ALB-DNS>/api
```

Example:

```
http://k8s-default-backendi-xxxx.us-east-2.elb.amazonaws.com/api
```

---

## 🔌 Backend API Endpoints

### 1️⃣ Register User

```
POST /api/register
```

```json
{
  "name": "Prajwal",
  "email": "prajwal@gmail.com"
}
```

---

### 2️⃣ Get All Users

```
GET /api/users
```

---

### 3️⃣ Delete User

```
DELETE /api/users/{id}
```

---

## 🗄️ Database Access

### Access via Kubernetes

```bash
kubectl get pods
kubectl exec -it mariadb-xxxx -- bash
mysql -u root -p
```

### Access via Port Forward

```bash
kubectl port-forward svc/mariadb 3306:3306
mysql -h localhost -P 3306 -u root -p
```

---

## 🚀 Deployment Flow (High Level)

1. Provision AWS infrastructure using **Terraform**
2. Create EKS cluster and node groups
3. Build backend Docker image and push to ECR
4. Deploy backend to Kubernetes
5. Deploy MariaDB to Kubernetes
6. Configure ALB Ingress for backend
7. Build React frontend (`npm run build`)
8. Upload frontend build to S3
9. Access application via public URLs

---

## 🔐 Security Considerations

* Database is **NOT publicly exposed**
* Backend accessible only via ALB
* Frontend hosted on S3
* IAM roles used for EKS access
* Kubernetes services used for internal communication

---

## 🧠 Interview-Ready Explanation

> “I deployed a full-stack application where the frontend is hosted on S3, the backend runs as containerized microservices on EKS, exposed via ALB Ingress, and the database runs securely inside the Kubernetes cluster. The entire infrastructure is provisioned using Terraform.”

---

## 📈 Possible Enhancements

* Add CloudFront (HTTPS)
* CI/CD with GitHub Actions / Jenkins
* Kubernetes Secrets for DB credentials
* HPA (Auto Scaling)
* Monitoring with Prometheus & Grafana

---

## 👨‍💻 Author

**Prajwal Pal**
B.Tech IT | Full Stack & DevOps Enthusiast

---

✅ **Project Status: Successfully Deployed & Tested**

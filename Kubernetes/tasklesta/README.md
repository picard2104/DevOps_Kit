# Kubernetes Deployment for Lesta

## Структура
- `docker/`: Dockerfile для сборки образа приложения
- `manifests/`: Базовые манифесты Kubernetes
- `helm-chart/`: Helm-чарт для управления развертыванием

## Быстрый старт
```bash
minikube start
kubectl apply -f manifests/postgres-*.yaml
helm install lesta-release helm-chart/lesta-start-chart/

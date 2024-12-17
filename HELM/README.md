# 🚀 Helm Installation and Configuration on Kubernetes

This guide walks you through installing and configuring **Helm** on a Kubernetes cluster.

## 📋 Prerequisites

Before you begin, make sure you have:

- A **Kubernetes cluster** up and running.
- **`kubectl`** installed and configured to interact with your cluster.
- Appropriate permissions to access the cluster.

---

## 🛠️ Step 1: Install Helm

### Install Helm on Linux, macOS, or Windows

You can install Helm using the following methods:

### Using the Script Installer

For **Linux** and **macOS**, run:

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

### Using Package Managers

- **macOS with Homebrew**:

  ```bash
  brew install helm
  ```

- **Windows with Chocolatey**:

  ```powershell
  choco install kubernetes-helm
  ```

- **Windows with Scoop**:

  ```powershell
  scoop install helm
  ```

### Verify the Installation

Check if Helm is installed correctly:

```bash
helm version
```

✅ **Expected Output:**

```
version.BuildInfo{Version:"v3.x.x", GitCommit:"...", GitTreeState:"clean", GoVersion:"go1.x.x"}
```

---

## 🔧 Step 2: Configure Helm with Kubernetes

### Add a Helm Repository

Helm uses repositories to fetch charts (packages). Add the official stable repository:

```bash
helm repo add stable https://charts.helm.sh/stable
```

### Verify the Repository List

```bash
helm repo list
```

### Update the Helm Repositories

Fetch the latest charts:

```bash
helm repo update
```

---

## 🚢 Step 3: Deploy a Sample Application with Helm

Let's deploy the **NGINX** application using a Helm chart.

### Install NGINX Using Helm

```bash
helm install my-nginx stable/nginx-ingress
```

### Verify the Deployment

Check if the NGINX pods are running:

```bash
kubectl get pods
```

### List Helm Releases

```bash
helm list
```

---

## 🧹 Step 4: Clean Up the Deployment

To uninstall the NGINX release:

```bash
helm uninstall my-nginx
```

---

## 📄 Resources

- [Helm Documentation](https://helm.sh/docs/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)

---

## 📝 License

This project is licensed under the **MIT License**.

---

### 💬 Feedback

If you encounter any issues or have suggestions, feel free to open an [issue](https://github.com/atharva038/issues) or submit a pull request.

--- 


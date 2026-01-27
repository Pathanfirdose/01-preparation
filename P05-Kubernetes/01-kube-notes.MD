# Kubernetes (K8s)
Kubernetes (K8s) is an open-source container orchestration platform that automates deploying, scaling, and managing containerized applications by grouping containers into logical units called *pods*, distributing them across a cluster of machines (nodes), handling service discovery, load balancing, self-healing (auto-restart, auto-replace, auto-reschedule), rolling updates, and resource management, making it the industry standard for running production-grade microservices at scale.

# Control plane
The Kubernetes control plane is the brain of the cluster that manages and coordinates all activities by making global decisions (like scheduling pods), tracking the cluster’s state, and responding to events; it consists of key components such as **kube-apiserver** (the central API through which everything interacts), **etcd** (the distributed key-value store that keeps all cluster data), **kube-scheduler** (decides on which node a pod should run), **kube-controller-manager** (runs controllers like node, replication, and endpoint controllers), and **cloud-controller-manager** (integrates with cloud providers), ensuring the entire cluster runs smoothly and remains desired-state compliant.

# woker node
A Kubernetes worker node is responsible for running application workloads and mainly consists of **kubelet** (the node agent that registers the node with the API Server, watches Pod specs, and ensures containers are running and healthy as defined), **container runtime** such as containerd, CRI-O, or Docker (which pulls images and actually creates, starts, and stops containers), **kube-proxy** (handles networking by maintaining iptables or IPVS rules to enable Service discovery and load balancing to Pods), and the CNI plugin (like Calico, Flannel, or Cilium, which sets up pod networking, assigns IP addresses, and enables pod-to-pod communication across nodes), along with supporting OS components such as cgroups and namespaces for resource isolation, and optionally node-level services like log collectors or monitoring agents.




# namespace
In Kubernetes, a namespace is a logical partition within a cluster that isolates and organizes resources so teams, applications, or environments can work without interfering with each other; it provides scoped naming, separate resource quotas, access control boundaries, and clean separation for things like dev/stage/prod, with default namespaces such as **default**, **kube-system**, **kube-public**, and optional custom namespaces for better management of large multi-tenant clusters.

```yaml
apiversion: v1
kind: namespace
metadata:
    name: expense
    labels: 
        project: expence
        environment: dev
```
# Pod
A pod in Kubernetes is the smallest deployable unit that represents one or more tightly coupled containers sharing the same network namespace, IP address, storage volumes, and lifecycle, allowing them to communicate efficiently and behave as a single application component, with Kubernetes scheduling pods onto nodes, restarting them if they fail, and managing them through higher-level controllers like Deployments or StatefulSets since pods themselves are ephemeral and not meant to be managed directly.

```yaml
apiversion: v1
kind: pod
metadata:
    name: nginx
spec:
    containers:
    - name: nginx
      image: nginx
```

# Multicontainer pod
A multi-container pod is a Kubernetes pod that runs two or more tightly coupled containers which share the same network namespace, IP address, and storage volumes, allowing them to communicate via localhost and work together as a single functional unit; these containers follow specific patterns like **sidecar** (helper container for logging, syncing, or proxying), **ambassador** (proxy for external services), or **adapter** (format/transform output), making multi-container pods useful when containers must collaborate closely while still remaining individually isolated processes.

```yaml
apiversion: v1
kind: pod
metadata:
    name: multicontainer
spec:
    containers:
    - name: nginx
      image: nginx
    - name: almalinux
      image: almalinux:v1
      command: ["sleep","100"]
```
# labels
In Kubernetes, labels are simple key-value pairs attached to objects like pods, services, and deployments to identify, categorize, and group them, enabling flexible selection and filtering without affecting the object's actual configuration; they are used heavily for operations such as pod selection by services, rolling updates by deployments, environment tagging (e.g., `env=prod`), and workload organization, with selectors (label selectors) allowing Kubernetes to target specific groups of resources dynamically.

```yaml
apiversion: v1
kind: pod
metadata:
    name: labels
    labels:
        project: expense
        module: backend
        environment: dev
spec:
    containers:
    - name: nginx
      image: nginx
```

# Annotations
In Kubernetes, annotations are key-value metadata attached to objects like pods, services, and deployments, similar to labels but intended for storing non-identifying, descriptive, or auxiliary information that tools and controllers can use; unlike labels, annotations are not used for selecting or filtering objects and can hold larger, more detailed data such as build info, release notes, contact details, debugging hints, or configuration metadata for external systems, helping enrich resources without affecting how Kubernetes manages or groups them.

```yaml
apiversion: v1
kind: pod
metadata:
    name: annotations
    annotations:
        imageregistry: "https://hub.docker.com/"
        buildurl: "https://jenkins.joindevops.com/expense/backend/build/67"
spec:
    containers:
    - name: nginx
      image: nginx
```
# ENV
In a Dockerfile, **ENV** is an instruction used to set environment variables inside the image so they are available to the container at runtime, allowing you to define configuration values, paths, or settings (e.g., `ENV APP_ENV=production`), which can then be accessed by applications or subsequent Dockerfile instructions; these variables persist in the final image layer and can be overridden later using `docker run -e` or Kubernetes environment variable settings.

```yaml
apiversion: v1
kind: pod
metadata:
  name: environment
spec:
  containers:
  - name: nginx
    image: nginx
    env:
      - name: course
        value: devops
      - name: trainer
        value: siva
      - name: duration
        value: 4 months
```
# resource-limit
In Kubernetes, **resource limits** define the maximum amount of CPU and memory a container is allowed to use, ensuring no single workload consumes excessive cluster resources; they work alongside **requests** (the minimum guaranteed resources) so the scheduler can place pods appropriately, and when a container exceeds its memory limit it is killed with an OOM error, while exceeding CPU limits causes throttling, making resource limits essential for stability, fairness, and predictable performance in multi-tenant clusters.

```yaml
apiverion: v1
kind: pod
metadata:
  name: limit
spec:
  containers:
  - name: nginx
    image: nginx
    resources:
      requests:
        cpu: 100m
        memory: 68mi
      limits:
        cpu: 120m
        memory: 100Mi
```
# Configmap
A ConfigMap in Kubernetes is an object used to store non-sensitive configuration data as key-value pairs so you can decouple configuration from container images and manage it centrally; applications can consume ConfigMaps as environment variables, command-line arguments, or mounted configuration files, enabling easy updates without rebuilding images, and ConfigMaps are typically used for things like app settings, URLs, feature flags, or config files that need to be injected into pods at runtime.

```yaml
apiversion: v1
kind: ConfigMap
metadata:
  name: nginx-config
data:
  coure: devops
  duration: 4 months
```

# secrets
In Kubernetes, a Secret is an object designed to store sensitive data such as passwords, tokens, certificates, and API keys in a base64-encoded form, allowing you to separate confidential information from container images and application code; Secrets can be injected into pods as environment variables or mounted as files, and they help reduce exposure by being stored in etcd with optional encryption at rest, having stricter access controls, and minimizing the risk of accidentally exposing sensitive values during deployments or logs.

# Services
In Kubernetes, a Service is a stable, permanent networking abstraction that provides a consistent IP and DNS name to access a set of pods, even as those pods get recreated or rescheduled, using label selectors to group them and enabling reliable communication; Services support different types such as **ClusterIP** for internal access, **NodePort** for exposing an app on each node’s port, **LoadBalancer** for exposing it externally via a cloud provider’s LB, and **ExternalName** for mapping to external resources, ensuring predictable connectivity in dynamic container environments.
    
**ClusterIp**
A **ClusterIP** Service in Kubernetes is the default Service type that exposes an application internally within the cluster by assigning a stable virtual IP address accessible only to other pods, enabling reliable in-cluster communication without exposing the service externally, and it uses kube-proxy rules to forward traffic to the appropriate backend pods selected via labels.

**NodePort**
A **NodePort** Service in Kubernetes exposes an application externally by opening a specific port (typically in the range **30000–32767**) on every node in the cluster, allowing traffic sent to any node’s IP and that port to be forwarded to the underlying pods selected by the service, making it useful for simple external access or when using an external load balancer that routes traffic to node ports, though it offers limited flexibility and less security compared to LoadBalancer or Ingress.

**Loadbalance**
A **LoadBalancer** Service in Kubernetes exposes an application to the internet by provisioning an external load balancer from the underlying cloud provider, assigning a public IP, and directing external traffic to the service, which then forwards requests to the appropriate backend pods via label selectors; it builds on top of NodePort and ClusterIP, automatically handling routing and providing a simple way to make applications accessible globally with minimal configuration.

# Replicaset

A **ReplicaSet** in Kubernetes is a controller that ensures a specified number of identical pod replicas are running at all times, automatically creating or deleting pods as needed to maintain that desired count; it uses label selectors to identify which pods to manage and provides high availability and fault tolerance, though in practice it is usually managed indirectly through a **Deployment**, which adds declarative updates and rollout capabilities on top of ReplicaSets.

# Deployment

A **Deployment** in Kubernetes is a higher-level controller that manages ReplicaSets and provides declarative updates for pods, allowing you to define the desired state of an application (such as the number of replicas, container images, and update strategy) and letting Kubernetes handle creating, updating, or rolling back pods automatically; Deployments enable features like rolling updates, rollbacks, scaling, and self-healing, making them the preferred way to manage stateless applications in a cluster.

# Statefulset

A **StatefulSet** in Kubernetes is a controller used to manage stateful applications that require stable, persistent identities and storage, ensuring each pod gets a unique, consistent name, hostname, and volume across restarts, providing ordered deployment, scaling, and deletion; unlike Deployments, StatefulSets maintain pod identity and retain data through PersistentVolumeClaims, making them ideal for databases, distributed systems, and workloads that rely on stable network endpoints and persistent state.

In a Kubernetes **StatefulSet**, pods are created using a strict, ordered, and identity-preserving process. When a StatefulSet is deployed, Kubernetes creates pods **sequentially** (0, 1, 2, …) and assigns each pod a **stable identity** based on its index, giving it a predictable name like `web-0`, `web-1`, etc., and each pod gets its own dedicated PersistentVolumeClaim (PVC) if volumes are defined. The StatefulSet controller ensures pods are created **one at a time**, waiting for each pod to become **Running and Ready** before creating the next, ensuring ordered startup, stable network identities through Headless Services, and persistent storage mappings that survive restarts or rescheduling.


# Headless service

A **Headless Service** in Kubernetes is a service created **without a cluster-assigned virtual IP** by setting `clusterIP: None`, allowing clients to directly discover and connect to individual pod IPs instead of load-balanced traffic; it is commonly used with **StatefulSets** to provide stable DNS records per pod (like `pod-0.service-name.namespace.svc.cluster.local`), enabling direct pod-to-pod communication, custom load balancing, and service discovery mechanisms such as those required by databases, distributed systems, or applications needing awareness of each pod instance.

# CrashLoopBackOff
**CrashLoopBackOff** in Kubernetes is a pod state that indicates a container is repeatedly crashing and restarting, and Kubernetes is backing off (waiting longer between retries) to avoid an endless loop. It happens when the container starts, fails, restarts, fails again, and so on. Common causes include application errors, missing config/env variables, failed dependencies, wrong image commands, permission issues, or readiness/liveness probe misconfigurations. You can troubleshoot by checking logs (`kubectl logs`), describing the pod (`kubectl describe pod <pod>`), verifying configuration, and fixing the root cause so the container can start successfully without crashing.
=============================================================================================







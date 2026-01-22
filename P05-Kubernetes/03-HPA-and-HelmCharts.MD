# Horizontal Pod Autoscaler (HPA)

A **Horizontal Pod Autoscaler (HPA)** in Kubernetes automatically scales the number of pod replicas in a Deployment, ReplicaSet, or StatefulSet based on real-time metrics like CPU usage, memory usage (via custom metrics), or external/custom metrics; it continuously monitors these metrics through the Metrics Server and adjusts the replica count to maintain a target utilization, enabling applications to handle varying loads efficiently by scaling out during high demand and scaling in when demand decreases, thus improving performance and optimizing resource usage.

# HPA vs VPA
**HPA (Horizontal Pod Autoscaler)** scales the *number of pod replicas* up or down based on metrics like CPU, memory, or custom metrics, helping handle varying traffic loads by adding or removing pods, while **VPA (Vertical Pod Autoscaler)** adjusts the *resource requests and limits* (CPU/memory) of each pod to ensure they have the right amount of resources; HPA focuses on scaling *out/in*, VPA focuses on scaling *up/down*, and although both can technically be used together, they must be configured carefully because HPA reacts to utilization changes while VPA changes the resource settings that HPA monitors, making them suitable for different types of workloads—HPA for stateless scalable apps and VPA for stable workloads with predictable scaling needs.

# Helm charts
A **Helm chart** is a packaged, versioned collection of Kubernetes manifests that makes deploying applications easier by templatizing YAML files and allowing configuration through values files, so you can install, upgrade, or rollback complex applications with a single command; Helm acts like a package manager for Kubernetes, where charts bundle deployments, services, configmaps, ingress, and other resources, enabling reusable, consistent, and customizable application deployments across environments.




# RBAC

**RBAC (Role-Based Access Control)** in Kubernetes is a security mechanism that controls who can access which resources by assigning permissions through **Roles** or **ClusterRoles** and granting them to users or service accounts using **RoleBindings** or **ClusterRoleBindings**; it helps enforce the principle of least privilege by defining fine-grained actions like get, list, create, update, or delete on specific resources, ensuring secure and controlled access within namespaces or across the entire cluster.
In Kubernetes **RBAC**, a **Role** is a set of permissions (rules) that allow actions like get, list, create, or delete on resources, but it applies **within a single namespace**, while a **ClusterRole** is similar but works **cluster-wide** or across all namespaces and is used for global resources like nodes or persistent volumes; to assign these permissions, a **RoleBinding** links a Role to a user, group, or service account within a namespace, whereas a **ClusterRoleBinding** links a ClusterRole to a subject at the **cluster level**, granting the defined access across all namespaces.


# Service accounts

A **ServiceAccount** in Kubernetes is an identity used by pods and controllers to authenticate and interact with the Kubernetes API, providing a secure way for workloads—not human users—to access cluster resources; each pod gets a default service account unless a custom one is assigned, and it can have specific permissions granted via RBAC, ensuring applications only have the minimal access they need for actions like reading ConfigMaps, listing pods, or interacting with other cluster components.


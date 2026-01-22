An AWS Load Balancer, part of Elastic Load Balancing (ELB), automatically distributes incoming application traffic across multiple targets (like EC2 instances, containers, or IP addresses) for high availability and fault tolerance, acting as a single point of contact for clients and routing requests based on listeners and rules to healthy backend resources. 

It scales automatically, performs health checks to remove unhealthy targets, and supports different types for various needs, ensuring applications remain responsive and reliable. 

# How it Works
* Clients Connect: Clients send requests to the load balancer's DNS name.
* Listeners Check Requests: Listeners, configured with protocols (e.g., HTTP, HTTPS) and ports, listen for these incoming requests.
* Rules Route Traffic: Listener rules determine where to send requests, directing them to specific Target Groups.
* Target Groups & Targets: A target group is a logical grouping of backend resources (Targets). The load balancer sends traffic to healthy targets within the group.
* Health Checks: ELB continuously checks target health; if a target fails, traffic is diverted to healthy ones. 

Key Benefits
High Availability & Fault Tolerance: Distributes traffic across Availability Zones (AZs) and removes unhealthy instances.
Scalability: Automatically scales to handle traffic spikes.
Security: Supports SSL/TLS termination and integrates with AWS Certificate Manager.
Monitoring: Provides real-time insights into application health and performance. 

# Types of AWS Load Balancers

***Application Load Balancer (ALB):** Operates at Layer 7 (application layer), ideal for HTTP/HTTPS traffic, supports path-based routing.

***Network Load Balancer (NLB):** Operates at Layer 4 (transport layer), high-performance for TCP/UDP, static IP support.

***Gateway Load Balancer (GWLB):** For deploying and managing third-party virtual network appliances.

***Classic Load Balancer (CLB):** The original ELB, now legacy, less advanced than newer types. 
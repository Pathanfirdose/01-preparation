# EFS

AWS EFS (Elastic File System) is a scalable, serverless, managed file storage service for AWS cloud and on-premises resources, providing elastic, shared access (NFS protocol) for Linux-based applications, automatically growing or shrinking as needed, ideal for web serving, big data, and shared directories without manual provisioning. It's designed for high availability and durability, allowing multiple compute instances (EC2, Lambda, containers) to access the same files concurrently, simplifying storage for modern, containerized, and serverless workloads. 

**Key Characteristics**

* Elastic & Scalable: Automatically grows and shrinks to store data, scaling from small to petabytes without downtime.

* Shared Access: Multiple instances or services can access the same file system simultaneously, unlike EBS.

* Serverless & Managed: No servers, storage, or patching to manage; it's a "set-and-forget" service.

* NFS Protocol: Uses Network File System (NFSv4) for standard file access.

* Pay-for-Use: You only pay for the storage you consume. 

**Common Use Cases**

* Content Management & Web Serving: Shared storage for web content.
* Container Storage: Persistent storage for ECS, EKS.
* Big Data & Analytics: Supports machine learning and big data workloads.
* Dev/Test & Home Directories: Shared environments for development or user files. 

**How it Works**

* Create File System: Define an EFS file system in the AWS Console, selecting a VPC and settings.
* Create Mount Targets: Configure mount points in specific Availability Zones within your VPC.
* Mount to Instances: Use provided commands to mount the EFS file system onto your EC2 instances or other compute services.
* Access Files: Multiple clients can then read and write to the shared file system. 

**Storage Classes & Features**

Storage Classes: Standard and Infrequent Access (IA) for cost optimization.
Encryption: Integrates with AWS KMS for data encryption.
Throughput Modes: Elastic, Provisioned, Bursting to match performance needs. 
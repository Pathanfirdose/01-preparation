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

# EBS

AWS EBS (Elastic Block Store) provides scalable, high-performance, persistent block storage volumes for Amazon EC2 instances, acting like virtual hard drives that can be attached to run databases, file systems, or applications, with data persisting even if the instance stops; it offers various volume types (SSD, HDD) for different needs (boot, general, high-performance) and supports durable snapshots for backups, ensuring high availability and durability within Availability Zones. 

**Key Features & Concepts:**

* EBS Volumes: Logical storage units (like disks) you attach to EC2 instances, formatted for file systems or used as raw block storage.
* Persistence: Data remains on the volume even if the attached EC2 instance is stopped, restarted, or terminated.
* Availability & Durability: Volumes are automatically replicated within an Availability Zone (AZ) to protect against component failure, offering high availability.
EBS Snapshots: Point-in-time, incremental backups of volumes that are stored independently, allowing for backups and recovery.
* Volume Types: Different types cater to workloads:
* SSD: General Purpose (GP2, GP3) for balanced performance; Provisioned IOPS (IO1, IO2) for mission-critical, low-latency apps.
* HDD: Throughput Optimized (ST1) for big data/streaming; Cold HDD (SC1) for infrequent access.
* Encryption: Supports encrypting volumes for security, often using AWS KMS. 
Common Uses:
* Boot volumes for EC2 instances.
Storing databases (MySQL, Oracle, SQL Server).
Running enterprise applications (SAP, Exchange, VMware).
Big data analytics, logging, and ETL processes. 

**How it Works:**

Create Volume: Provision an EBS volume (choose type, size, AZ) in the EC2 console.
Attach to Instance: Attach the volume to an EC2 instance in the same AZ.
Format & Use: Create a file system (e.g., ext4, NTFS) and mount it, or use it directly.
Backup: Take snapshots for disaster recovery or data protection. 
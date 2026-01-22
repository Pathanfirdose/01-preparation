# Secret manager
AWS Secrets Manager is a service for securely storing, managing, and retrieving sensitive information like database credentials, API keys, and tokens, eliminating the need to hardcode them in applications. It offers features like automatic rotation, encryption at rest, programmatic access, auditing via CloudTrail, and integration with AWS KMS for robust security and compliance, centralizing secret lifecycle management. 

**Key Features & Benefits:**
* Secure Storage: Encrypts secrets using AWS KMS keys, storing them securely.
* Automatic Rotation: Rotates credentials for supported services (like RDS) automatically on a schedule, reducing risk.
* Centralized Management: Manage secrets for AWS, third-party services, and on-premises resources from one place.
* Programmatic Access: Applications dynamically retrieve secrets at runtime via SDKs or the API, avoiding hardcoding.
* Audit & Monitoring: Integrates with CloudTrail and CloudWatch for auditing secret access and usage.
* Replication: Replicate secrets across AWS Regions for disaster recovery. 
How It Works:
* Store: You store secrets (e.g., database passwords) in Secrets Manager, giving them a name.
* Secure: Secrets are encrypted and managed with access controls via IAM.
* Retrieve: Your application calls the Secrets Manager API at runtime to fetch the secret.
* Rotate: A Lambda function (or custom code) updates the secret in Secrets Manager and the target service (e.g., database). 

**Use Cases:**
* Database Credentials: Securely manage RDS, Redshift, and other database passwords.
API Keys: Store keys for services like Amazon S3, Stripe, or other third-party APIs.
OAuth Tokens & Encryption Keys: Manage tokens and KMS keys used by applications. 
* Getting Started:
Access via the AWS Console, AWS CLI, or SDKs (Python, Java, .NET, etc.).
Create a secret, configure rotation (if applicable), and get sample code to integrate into your application.
 
# KMS
AWS Key Management Service (KMS) is a managed service that simplifies creating, controlling, and using cryptographic keys for encrypting data across AWS and within your applications, protecting sensitive information with hardware security modules (HSMs) and integrating with over 100 AWS services for centralized security and compliance. It manages the full lifecycle of keys, offering customer-managed and AWS-managed options, enabling encryption, decryption, signing, and HMAC generation, and logging all key usage via AWS CloudTrail. 

**Key Functions & Benefits**
* Centralized Control: Manage key lifecycles and permissions from a single point, separating key management from key usage.
* Data Encryption: Encrypt data at rest in services like S3, EBS, RDS, and in your own applications using the AWS Encryption SDK, ensuring data confidentiality.
* Digital Signatures & MACs: Generate and verify digital signatures and Message Authentication Codes (MACs) for data integrity.
* Hardware Security: Keys are protected by FIPS 140-3 validated HSMs, never leaving KMS unencrypted.
* Integration: Seamlessly integrates with numerous AWS services (S3, Lambda, DynamoDB) and your own code.
* Auditing: Logs all API calls through AWS CloudTrail for detailed security auditing. 

**Types of KMS Keys**
* Customer Managed Keys (CMKs): Offer full control over key policies, rotation, and lifecycle, with associated monthly and usage costs.
* AWS Managed Keys: Automatically created and managed by AWS for specific services, with limited user control but no direct cost. 

**How it Works**
You create keys in KMS, define policies (who can use them and how), and then use KMS APIs or integrated service features to encrypt or decrypt data. For large amounts of data, KMS uses envelope encryption, encrypting data with a data key, and then encrypting the data key with a KMS key. 
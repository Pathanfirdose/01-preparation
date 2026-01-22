# IAM

AWS IAM (Identity and Access Management) is a core AWS service for securely controlling access to AWS resources, allowing you to manage users, groups, roles, and permissions to define who (users/applications) can do what (actions) on which (resources) under what conditions, ensuring least privilege access and centralizing identity management for your AWS environment. 

**Core Components & Concepts:**

**Users:** Individual accounts for people or applications.
**Groups:** Collections of users, making it easier to assign permissions to many users at once.
**Roles:** Entities that grant temporary permissions (credentials) to trusted identities (users, apps, AWS services) to perform specific actions, without needing long-term passwords.
**Policies:** JSON documents that define permissions (what actions are allowed/denied) and are attached to users, groups, or roles.
**IAM Identity Center:** (Successor to AWS SSO) for centrally managing workforce access across multiple AWS accounts and applications. 

**Key Functions:**

* Authentication: Verifying who you are (e.g., password, MFA).
* Authorization: Determining what you are allowed to do (based on policies).
* Least Privilege: Granting only the necessary permissions for a job, reducing security risks.
* Federation: Integrating with your existing corporate directories (like Active Directory) for single sign-on. 

**How it Works:**
You create users, groups, and roles in IAM.
You define permissions using policies that specify allowed actions (e.g., s3:GetObject, ec2:RunInstances).
Policies are attached to users, groups, or roles.
When an identity (user or application) tries to access an AWS resource, IAM checks their identity and associated policies to see if the action is permitted.
You can use IAM Identity Center to manage workforce access across many accounts and integrate with your identity provider. 
In essence, IAM acts as the digital gatekeeper for your AWS environment, ensuring secure and controlled access. 

# AWS Config

AWS Config is a fully managed Amazon Web Services (AWS) service that provides a detailed view of your AWS resources, their configurations, and how they've changed over time, enabling continuous security and compliance auditing by recording history, assessing configurations against rules, and facilitating troubleshooting. It helps manage resource inventory, track changes, evaluate compliance with defined policies, and automate remediation, ensuring your AWS environment aligns with organizational standards. 

**Key Capabilities**

* Resource Inventory: Discovers and maps all your AWS resources and their relationships, providing a complete inventory.
* Configuration History: Records detailed configuration changes over time, allowing you to see what a resource looked like at any past point.
* Continuous Compliance: Audits resource configurations against your desired state using customizable rules (Config Rules) and pre-built packs (Conformance Packs).
* Security Analysis: Helps analyze security posture by identifying non-compliant resources, like S3 buckets with public access.
* Troubleshooting & Remediation: Simplifies issue resolution by correlating changes with events and offers automated remediation actions. 

**How It Works**

* Recording: You configure a recorder to capture configuration changes for specified resources.
* Evaluation: Config rules (built-in or custom with Lambda) continuously check resources for compliance.
* Reporting: Provides compliance status (compliant/non-compliant) and sends notifications.
* Remediation: Can trigger AWS Systems Manager Automation to fix non-compliant resources. 

**Use Cases**

Security & Governance: Ensuring all databases have encryption enabled.
Operational Troubleshooting: Quickly identifying configuration changes that caused an outage.
Compliance Auditing: Meeting regulatory requirements like HIPAA or PCI DSS. 
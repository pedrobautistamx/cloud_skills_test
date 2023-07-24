# Evaluation Questions

## SECTION 1: GIT

---
**1. If you use `git stash`, where will it save data? What is the difference between index and staging area?**

- When you use git stash, the changes in your working directory that are not yet committed are saved temporarily in a special area called the Git stash.
 - The index represent the snapshot of your working directory that will be committed when you run git commit.
 - Staging Area is like a pre-commit area where you've prepared and validated the changes before they are permanently recorded in the repository history.

---
---
**2. When would individuals use `git rebase`, `git fast-forward`, or a `git fetch` then push?**

- Git rebase: Takes the changes from the source branch and applies them to the target branch, creating a new commit history.

- Git fast-forward: Fast-forward merges keep the history linear and make the target branch up-to-date with the changes from the source branch.
- Git Fetch & Push: Is a way to update your local copy of a remote branch without actually merging the changes into your local branch.

---

---
**3. How to revert already pushed changes?**

- Create a new commit that reverts the changes. To perfom this,  is necesary to identify the commit hash of the changes you want to revert. You can do get it using the git log command. Once you have the commit hash, you can use the git revert command to create a new commit that undoes the changes. Finally, you will need to push the new commit to the remote repository.
---

---
**4. What is the difference between cherry-picking commits and trying a hard reset? What is the final outcome of the `HEAD` reference?**

- Cherry-picking is the process of selecting a single commit from a branch and applying it to another branch. This can be useful if you want to incorporate a specific change from one branch into another, without bringing in all of the other changes from that branch.  
- Hard reset is the process of resetting the HEAD reference to a previous commit. 

---

---
**5. Explain the difference between `git remote` and `git clone`?**

- git remote is used for managing remote repository connections in your existing local repository, while git clone is used to create a local copy of a remote repository. 

---


## SECTION 2: TERRAFORM

---
**1. What is the difference between `terraform count` and `for_each` metadata function? Give a scenario-based example to use them.**

- count is a meta-argument that can be used to create a set of resources with a specific number of instances. For example, you could use count to create 10 instances of an EC2 instance.

* Scenario: Create multiple instances for a load balancer. You can use count to create a fixed number of instances based on a variable. For example:

```tf
variable "instance_count" {
  description = "Number of GCP instances to create."
  default     = 3
}

resource "google_compute_instance" "instance" {
  count        = var.instance_count
  name         = "instance-${count.index}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
}
```

- for_each is a meta-function that can be used to create a set of resources that are iterated over a list of values.

* Scenario: Create multiple compute instances, each with its own specific configuration. You can use for_each with a map to achieve this. 

```tf
variable "instances" {
  description = "Map of instance configurations."
  default = {
    instance1 = { machine_type = "n1-standard-1", zone = "us-central1-a" },
    instance2 = { machine_type = "n1-standard-2", zone = "us-central1-b" },
    instance3 = { machine_type = "n1-standard-2", zone = "us-central1-c" },
  }
}

resource "google_compute_instance" "instance" {
  for_each = var.instances

  name         = each.key
  machine_type = each.value.machine_type
  zone         = each.value.zone
  
}
```
---


---
**2. What is Terraform `taint`? When to use it? When would you use `terraform state rm` vs `terraform taint`?**

- Terraform `taint` is a command that allows you to manually flag a resource as tainted, which means it will be destroyed and recreated on the next terraform apply. 
Taint command is used to recreate a resource, even if the resource's configuration has not changed. This can be useful if you need to force Terraform to recreate a resource due to an error or because you need to make changes to the resource that cannot be made through the Terraform configuration.

- The `terraform state` rm command is used to remove a resource from the Terraform state. This means that Terraform will no longer track the resource and will not attempt to recreate it on the next terraform apply.
---

---
**3. How would you show a diagram of all Terraform resources in the state file? When is this useful?**

- `terraform graph command` will create a graph of all the resources in the state file, including their relationships. The graph can be output in a variety of formats, including PNG, SVG, and DOT.
- It can help to:
   - Understand the dependencies between your resources.
   - Identify potential problems with your infrastructure.
   - Document the infrastructure. 

---

---
**4. Solve this expression:**

```tf
count = var.run_remote_environment ? var.TFC_RUN_ID !=["Yes"]) : null
```

- The expression first checks the value of the ```var.run_remote_environment``` variable. If the value of the variable is ```Yes```, then the expression will check the value of the ```var.TFC_RUN_ID``` variable. If the value of the ```var.TFC_RUN_ID``` variable is not equal to ```Yes```, then the expression will return the value of the count variable. Otherwise, the expression will return ```null```.


---

---
**5. How would you apply terraform to multiple accounts simultaneously? We want to ensure this
follows secuirty best practices.**

- You can use a combination of Terraform workspaces and Terraform configuration files with different provider configurations. The steps could be as follows: 
  - ```Organize the project directory:``` To keep your Terraform project organized, you should create a directory structure with separate directories for each account and environment. This will make it easier to find and manage the configuration files for each account and environment.
  - ```Configure provider for each account:``` In each account-specific directory (account1/, account2/, etc.), configure the provider with the appropriate provider access credentials or IAM roles for that account.
  - ```Create terraform workspaces:``` Each account-specific directory, create a Terraform workspace using the terraform workspace new command.
  - ```Configure variables:``` Create variables.tf files in each directory to define any required variables for that account/environment. Adjust variable values based on the environment.
  - ```Use Remote State:``` Create variables.tf files in each directory to define any required variables for that account/environment. Adjust variable values based on the environment.


---





## SECTION 3b: GCP

---
**1. What are different network connectivity options to connect from On-prem or another cloud to
GCP?**

- There are some network connectivity options to connect from one local cloud or another to GCP: 
  - ```Direct Peering:``` This is a dedicated connection between your on-prem network and GCP. It is the most secure option, but it can be the most expensive.
  - ```VPN:``` This is a virtual private network that connects your on-prem network to GCP over the public internet. It is less secure than direct peering, but it is also less expensive.
  - ```Cloud Interconnect:``` This is a Google-managed network that connects your on-prem network to GCP. It is a good option if you need a secure and reliable connection, but you do not want to manage your own network.
  - ```Cloud VPN:``` This is a Google-managed VPN that connects your on-prem network to GCP. It is a good option if you need a secure and reliable connection, but you do not want to manage your own VPN.
  - ```Cloud Load Balancing (TCP/UDP):``` This is a Google-managed load balancer that can be used to connect your on-prem network to GCP. It is a good option if you need to connect to multiple GCP services.

---

---
**2. Where & how the FW rules are managed in GCP when using shared VPC architecture?**

Firewall rules in GCP are managed in the Shared VPC architecture in the following locations:
- ```Shared VPC host project:``` The host project is the project that owns the shared VPC network. Firewall rules in the host project control traffic between the shared VPC network and the internet, as well as traffic between the shared VPC network and other projects in the same organization.
- ```Linked project:``` A linked project is a project that is connected to the shared VPC network. Firewall rules in the linked project control traffic between the linked project and the shared VPC network.
- ```VM instances:``` Firewall rules can also be configured on individual VM instances in the shared VPC network. These rules control traffic between the VM instance and the rest of the network.

---

---
**3. How do you connect to GKE cluster from GCP cloudshell?**

It is possible to do so with the following steps: 
- Open Cloud Shell.
- In the Cloud Shell terminal, run the following command to list the GKE clusters in your project:
```console
gcloud container clusters list
```
- The command will output a list of GKE clusters in your project. Find the cluster that you want to connect to and note the name of the cluster.

- Run the following command to connect to the GKE cluster:
```console
gcloud container clusters get-credentials <cluster-name>
```
- Once you are connected to the GKE cluster, you can run Kubernetes commands to manage the cluster.
```console
gcloud container clusters list

NAME    LOCATION    MASTER_VERSION    NODE_VERSION
my-cluster  us-central1-a  1.21.12-gke.1600  1.21.12-gke.1600
```
---

---
**4. How is GCP VPC networking is different than AWS VPC networking?**

```Network Topology```

One of the key differences between GCP VPC networking and AWS VPC networking is the network topology. GCP VPC networks are flat networks, meaning that all of the resources in a VPC network can communicate with each other directly. AWS VPC networks, on the other hand, are hierarchical networks, meaning that resources in different subnets can only communicate with each other if they are in the same subnet or if they are connected through a VPN or a VPC peering connection.

```Network Address Translation (NAT)```

Another key difference between GCP VPC networking and AWS VPC networking is how NAT is handled. In GCP, NAT is handled by a single NAT gateway for each VPC network. This means that all of the resources in a VPC network must use the NAT gateway to access the internet. In AWS, NAT is handled by a NAT instance for each subnet. This means that resources in a subnet can use the NAT instance to access the internet without having to go through the NAT gateway for the VPC network.

```Firewall Rules```

GCP VPC networking and AWS VPC networking also differ in how firewall rules are handled. In GCP, firewall rules are applied to individual subnets. This means that you can have different firewall rules for different subnets in the same VPC network. In AWS, firewall rules are applied to individual VPC networks. This means that you can only have one set of firewall rules for all of the subnets in a VPC network.

---
---
**5. Explain high level steps to create a service project in GCP org with Shared VPC enabled?**

To create a service project in GCP organization with Shared VPC enabled, you can follow these high-level steps:

- ```Set Up the Host Project (Host Project Owner):```  The host project is the central project that manages the VPC network and other network resources. Service projects can then attach to the host project and access the shared network resources.

- ```Enable the Shared VPC Feature:``` The Shared VPC feature allows you to share a VPC network with other projects in your organization. This can be useful for isolating different parts of your infrastructure or for giving other teams access to your network resources.

- ```Create a Shared VPC Network:```  The VPC network is the foundation of your network infrastructure. It defines the IP address range, subnets, and other network configurations that will be used by your instances and services.

- ```Grant Appropriate Permissions:``` IAM roles are used to control who has access to what resources in Google Cloud Platform. When you define an IAM role, you specify the permissions that the role will have.

- ```Create a Service Project:``` Create a new project (the service project) within the GCP organization. This project will utilize the resources of the Shared VPC network created in the host project.

- ```Configure Subnets and Resources:``` Within the service project, you have the option to either create new subnets within the shared VPC network or utilize the existing ones. Afterwards, you can deploy VM instances, Google Kubernetes Engine (GKE) clusters, and any other required resources within these designated subnets.

- ```Assign IAM Roles to Service Project Users:``` Within the service project, you will need to allocate the necessary IAM roles to users or service accounts. This will provide them with the authorization to manage and utilize resources within the project.

- ```Verify Network Connectivity:``` Test network connectivity between resources in the service project and other projects that are part of the Shared VPC.

- ```Implement Network Security and Firewall Rules:``` Establish suitable firewall rules and network security policies to govern the flow of traffic between resources within the service project and among other projects within the Shared VPC.
---


# Evaluation Questions

## SECTION 1: GIT

1. If you use `git stash`, where will it save data? What is the difference between index and staging area?
<div style="background-color: #f0f0f0; color: black; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
<p> - When you use git stash, the changes in your working directory that are not yet committed are saved temporarily in a special area called the Git stash.</p>
<p> - The index represent the snapshot of your working directory that will be committed when you run git commit. </p>
<p> - Staging Area is like a pre-commit area where you've prepared and validated the changes before they are permanently recorded in the repository history. </p>

</div>

2. When would individuals use `git rebase`, `git fast-forward`, or a `git fetch` then push?
<div style="background-color: #f0f0f0; color: black; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
<p>
<b>Git rebase: </b> Takes the changes from the source branch and applies them to the target branch, creating a new commit history
</p>
<p><b>Git fast-forward: </b> Fast-forward merges keep the history linear and make the target branch up-to-date with the changes from the source branch.</p>
<p><b>Git Fetch & Push: </b> Is a way to update your local copy of a remote branch without actually merging the changes into your local branch. </p>


</div>

3. How to revert already pushed changes?

<div style="background-color: #f0f0f0; color: black; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
<p> - Create a new commit that reverts the changes. To perfom this,  is necesary to identify the commit hash of the changes you want to revert. You can do get it using the git log command. Once you have the commit hash, you can use the git revert command to create a new commit that undoes the changes. Finally, you will need to push the new commit to the remote repository. </p>

</div>

4. What is the difference between cherry-picking commits and trying a hard reset? What is the final outcome of the `HEAD` reference?

<div style="background-color: #f0f0f0; color: black; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
<p> - Cherry-picking is the process of selecting a single commit from a branch and applying it to another branch. This can be useful if you want to incorporate a specific change from one branch into another, without bringing in all of the other changes from that branch. </p>
<p>- Hard reset is the process of resetting the HEAD reference to a previous commit. 
</p>

</div>


5. Explain the difference between `git remote` and `git clone`?

<div style="background-color: #f0f0f0; color: black; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
<p> - git remote is used for managing remote repository connections in your existing local repository, while git clone is used to create a local copy of a remote repository. 
</p>

</div>

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


---





## SECTION 3b: GCP
1. What are different network connectivity options to connect from On-prem or another cloud to
GCP ?
2. Where & how the FW rules are managed in GCP when using shared VPC architecture ?
3. How do you connect to GKE cluster from GCP cloudshell ?
4. How is GCP VPC networking is different than AWS VPC networking ?
5. Explain high level steps to create a service project in GCP org with Shared VPC enabled ?
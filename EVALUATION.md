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
<p> - Cherry-picking is the process of selecting a single commit from a branch and applying it to another branch. This can be useful if you want to incorporate a specific change from one branch into another, without bringing in all of the other changes from that branch. </p>
<p>- Hard reset is the process of resetting the HEAD reference to a previous commit. 
</p>

</div>

## SECTION 2: TERRAFORM

1. What is the difference between `terraform count` and `for_each` metadata function? Give a scenario-based example to use them.

2. What is Terraform `taint`? When to use it? When would you use `terraform state rm` vs `terraform taint`?

3. How would you show a diagram of all Terraform resources in the state file? When is this useful?

4. Solve this expression:

```tf
count = var.run_remote_environment ? var.TFC_RUN_ID !=["Yes"]) : null
```
5. How would you apply terraform to multiple accounts simultaneously? We want to ensure this
follows secuirty best practices.

## SECTION 3b: GCP
1. What are different network connectivity options to connect from On-prem or another cloud to
GCP ?
2. Where & how the FW rules are managed in GCP when using shared VPC architecture ?
3. How do you connect to GKE cluster from GCP cloudshell ?
4. How is GCP VPC networking is different than AWS VPC networking ?
5. Explain high level steps to create a service project in GCP org with Shared VPC enabled ?
---
title: "Terraform Modules Suck, but you should still use them"
date: 2019-06-10T19:02:48-04:00
draft: false
tags: [ Terraform ]
---

## Terraform

Like so many other people I jumped into Terraform right away.  This was the answer I was looking for.  It could provide an automated way to store AWS configurations in source control.  It also let me try out Azure, Google, and many other providers in a cloud-agnostic (sorta) kinda of way. 

Within a few days there were segments of code everywhere to create an EC2 instance.  Everybody on my team made their own Terraform code.

## Terraform Modules

Hey!  Let's throw all this code together into a re-usable component, so the next time we need to a test environment, we can just use a module to do it!  We can have a "test environment" module that we re-use everywhere. We all rejoiced, because who doesn't like reusable code!

## But then the problems hit

"Uhm, hey, so you made a change to this module for your project, but it's going to cause my EC2 instances to be destroyed and re-created." ~ Every infra developer on our team. The module layout being used was very very brittle and it needed to be changed, fast.

Terraform modules are a great way to keep you from re-writing your code over and over #DRY but can you really test that this underlying module code does what it's supposed to do in EVERY instance where it's been used in your Terraform stack?  The worst offenders for changing this variable are when somebody would update the module to add some form of if/then/else logic into the module (Terraform doesn't really support this natively, but trust sme, you can hack some pretty awesome shit into vanilla Terraform files if you know what you're doing.) 

Ultimately, the team gave up on modules as a whole, but here's what was missing:

## The Terraform Module Manifesto

* I __WILL__ use Terraform Modules to keep my code DRY
* I will __write a test__ that consumes my new Terraform module.
* I will __NOT__ make an all-encompassisng module.  Ten modules are better than one.
* I will __version pin__ my use of modules.

## Why these matter

* __Keep your code DRY__ I don't think I need to explain this one.  Use a Terraform module anytime you're going to be copying the same style of resource creation. If your organization demands that you spin up an AWS S3 bucket with a certain bucket policy, tagged with same same five tags, this is a great reason to write a Terraform module.  

* __Module Tests__ In our organization we decided on a simple folder structure of `modules/module_name` and `tests/module_name`.  Each newly created module must create both folders.  In the tests folder, we create a simple test that allows a `terraform plan` statement to execute against the module.  We don't apply the test right now, we might in the future, but this gives the CI system something to go by to ensure you've properly added all of the required variables, your code will at least pass a Terraform plan statement, and the module exists.  It isn't much, but it's a good start.  The other have of these test cases is to provide other team members with an example or two of how the module should be called!  Which variables can be optional, and how that impacts the plan. 

* __The All encompassing module__ So you need an S3 bucket created with a few tags?  Great choice for a module.  It's a private module, with logging and versioning.  Oh, the next guy doesn't need logging, but he needs lifecycle rules?  Let's update the module (it's version pinned right?) and craft some `count=0` statements, and maybe a `ternary ? true : false` logic statement or two, and Viola! Now your module can do both.  Tomorrow I'm going to show you how it can also setup public S3 buckets too!  <-- Story of our lives, but stop, just stop.  A Terraform module should have a purpose outlined in it's Readme file.  "I help you create a Private S3 bucket that is versioned and logged" Your readme file should include a scope statement about things this module can do, but you might want to consider things you're afraid somebody else might try to make it do.

### Example Scope Statement
* "I help you create  Private S3 bucket that is versioned and logged"
* Things this module might do in the future : Custom Bucket Policy passed in as JSON
* This it should not do: Making Public Buckets, Buckets with LifeCycle rules

* __Version Pinning__ Terraform modules help a lot, but they can be fluid and constantly changing.  When you consume a Terraform module you need to work on a version pinning system!  This means no writing Terraform modules and referencing them into your application with `../modules/module_name` format!  

__Seriously, stop here and make yourself a new Git repo for those modules.__ At a minimum, you can now use the Terraform "git revision selection" git::https://example.com/vpc.git?ref=v1.2.0 to specify a Git tag of your module's version.  You now have version pinned modules (with a bit of git tag work on the new module push.) 

Our team went a bit further and enabled a CI system which can:
 * Identify what module inside the repo changed
 * Check to see `modules/changed_module` directory passes the `terraform fmt` command for proper formatting.
 * Executes a `terraform plan` in the `tests/changed_module` folder (Plan only, it's a symantic thing at this point. We might apply/destroy the tests later)
 * Keeps track of each module's individual version number! 
 * Bumps the module version, and creates a .zip file of the `modules/changed_module` folder when changes to master are pushed.  These .zip files are pushed to an internal artifact server so we can consume them using vanilla HTTP internally.  

## Other Lessons?

What are other lessons you've learned from using (or not using) Terraform modules?  What do you wish the world knew before you got started (a.k.a. trapped) in your current Terraform setup? 

## The Dictionary

|Definition | Meaning
:-----------|:---------------------------
AWS | Amazon Web Services
DRY | Don't Repeat Yourself
Coffee | What I run on.  Like what you read? Consider buying me a [Coffee](https://ko-fi.com/agilesyndrome)

---
title: "16 Point Checkup"
date: 2019-10-2310:25:00-04:00
draft: false
layout: single
tags: [Quality, CI]
---

## My Car

I take my car in for regular maintenance.  It's the only car my family owns, so keeping it running top-notch is important to me.  The technicain tells me they did a "complete vehical checkup" following a 21-point guideline.  All system were good on my recent checkup including Exhaust, Fluids, Tires, Lights.  I never really care what's on the checklist, until something breaks. My car gets me from point A to B reliably.  I don't examine the tires every time I get in my car.  I depend on the technicians to tell me how healthy the tire treads are when I get an oil change.  I'm thankful they look at my car and tell me to start budgeting for four new tires earlier than expected.

## The 16 quality checkpoints.

Every time you deploy new software, you should run through the software checkup 16-point guide.  This process should be automated by your CI system, and reviewed by your team where automation isn't in place yet. 

### Source Code

**Version Control** : 

Your source code is maintained under some version control system such as Git or TFS. If you're not currently using source control, [reach out to me](/contact), and I'll point you in the right direction... but you should probably stop reading here. 

**Branch Management** :

- Your team has selected, and adheres to a branching strategy.
- At least one branch of code is dedicated for `production` quality code.  In Git, this branch is typically `master`. In other systems, it may have different names. 
- No direct commits are made to the protected branch. You must conduct a code review / pull request to merge code into this branch.
- Every new feature starts from the latest `production` locked branch.
- Branches should never live a long time.

I'm not going to preach about the merits of one branching strategy or another, but your team should have one, it should be well documented, and it should probably be a model commonly shared across the development community as a whole, and not one your company made up on their own. For information about common branching strategies, check out this list of resources: 

- [A successsful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [GitLab Flow](https://docs.gitlab.com/ee/workflow/gitlab_flow.html)
- [OneFlow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow)

**Static Analysis** :

Use a code analysis tool to check for code quality issues.  These tools are readibly available and easy to integrate with your deployment system. If your team wants to use four spaces instead of two for indents, that's okay, but update the configuration file instead of expecting developers to know these standards.  I work for four separate teams, each with their own coding standards.  I depend on their standards being conveyed in a way that my IDE can understand automatically.  [Node/JavaScript](https://eslint.org/) | [Ruby](https://github.com/rubocop-hq/rubocop)
| [Java](https://github.com/checkstyle/checkstyle) | [Docker](https://github.com/hadolint/hadolint) | [Bash](https://github.com/koalaman/shellcheck)

You can even off-load the static analysis onto tools like [Codacy](https://www.codacy.com/). I strongly recommend tools like this because it makes it easy for developers to see overall code issues. Even this blog is managed on Codacy. [Results](https://app.codacy.com/manual/AgileSyndrome/blog.agilesyndro.me/dashboard). Currently I scored a "B" on Code Quality. I should work on that. [![Codacy Badge](https://api.codacy.com/project/badge/Grade/aa6a459814944b03a7863b98a2de58af)](https://www.codacy.com/manual/AgileSyndrome/blog.agilesyndro.me?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=agilesyndrome/blog.agilesyndro.me&amp;utm_campaign=Badge_Grade)



## Testing
**Code Coverage** :

**Vulnerability Scans** :
Open source scan

**Artifact version control** :
  - Don't deploy from your source control system! (Even if it's easy)
  - Your build system should generate some type of `.zip` or tarball file and make it available for deployment later. 
  - Deploy `artifacts` not `code`

Auto provisioning - based on branches or tags.

**Immutable Servers** :


**Integration testing** :

## Deployment
**Dynamic Configuration** :
  - The code does not rely on static configuration files
  - The configuration 


Performance testing
Build deploy testing automated for every commit - Test all commits. 

## Deployment

Automated rollback
Automated change order
Zero downtime release
Feature toggle

## Inspiration and Thanks

Pieces of this article were taken in part from the following sources of inspriation. Capital One's pipeline article was perhaps the largest inspriation and worth a read.

- [Focusing on the Devops Pipeline (Capital One)](https://medium.com/capital-one-tech/focusing-on-the-devops-pipeline-topo-pal-833d15edf0bd)
- [11 Rules of GitLab Flow](https://about.gitlab.com/blog/2016/07/27/the-11-rules-of-gitlab-flow/)

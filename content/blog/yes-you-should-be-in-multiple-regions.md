---
title: "Do you really need redundancy in us-west-1?"
date: 2020-03-09T07:57:35-04:00
draft: false
layout: single
tags: [AWS, High Availability, Failover]
---

I recently looked back through my blog entries and came across an older article.
"[Do you really need redundancy in us-west-1](https://agilesyndro.me/blog/multi-region-or-multi-zone/)". For context,
as I'm writing this article, we're about a week after AWS experienced a short outage in both `us-west-1` AND `us-west-2`
at the same time. We're also a few weeks after a multi-hour outage of `us-east-1`.

Let me be clear. **I was wrong.** If I led you astray, and your site suffered due to recent outages, I'm sorry.
Let's make things right.

It used to be "extremely rare" for AWS to experience a multi-availability zone outage (for instance, an outage impacting
us-east-1a and us-east-1b at the same time). However, this seems to be happening more frequently, and we should look at it again. Moreso, I cannot recall **ANY** time when AWS has experienced an outage in multiple regions simultaneously (such as the outage in us-west-1 and us-west-2 simultaneously). We see that AWS has undocumented
dependencies on its us-east-1 to keep its control plane running. Its APIs heavily depend on us-east-1,
regardless of where you're running your services.

For beginners, don't start in us-east-1! If you're a new company, pick any region, any region at all, but don't start
your journey in us-east-1. You'll regret it. This region is fraught with issues regarding the availability of certain EC2
instance types, and availability issues. Ohio (us-east-2) is a lovely place and a place where I run all of my  
services personally. I digress though, the purpose of this article is to re-evaluate if you need to be multi-regioned.

As we saw recently, even if you had gone through the months of refactoring to be multi-regioned, if you had picked
us-west-1 and us-west-2 as your regions, you still would have gone down! Again, although this is rare, we need to discuss
a *safe* strategy to have high availability and minimize the risk of AWS outages.

## Loosely Coupled Architecture

First, make sure you're defining your services as loosely coupled. Create an event bus from the ground up. Leverage
architectures like Kafka, Pub/Sub, and event queues liberally.  If your app depends on the results of another 3rd-party
service in real-time, you're doing something wrong. If your app cannot sustain a 3rd party app failure or any of your services, your architecture needs help... immediately.

Although some app components will inevitably depend on other elements, you should limit these
scenarios. Teach your app to gracefully wait for other members to come back into the ready state. Queue up work items
that can wait, and prepare for those queues to hold data for 2-3 days. Prepare for and imagine scenarios where 7-10 days
might go by without that service being online. Develop from the ground up around those scenarios. You'll thank me later.
The world is changing, and so is the way we develop interdependencies.

## Observability

How many messages are in your queue? How long have they been there? Have your customers noticed a delay in message
processing before you did? How would you know?

Make sure your app supports publishing metrics about the work it is doing, and the work it's asking other services to
do. These metrics will be crucial in your alerting, paging, and dashboards. You'll need to know when a queue is backed up,
how long messages are waiting, and the velocity of that queue. (Velocity is the measure of distance over time. Miles per
hour is a measure of velocity, as is messages processed per minute.)


## Cloud Agnostic Infrastructure

Multi-Cloud is a challenging topic for some people, but please start working towards being "Cloud Agnostic," one decision at a time.
Don't lock yourself into AWS DynamoDB when MongoDB might be a decent alternative. Why use AWS Simple Queue Service (SQS)
when RabbitMQ supports any cloud you want to run on? You don't have to run your RabbitMQ servers. Some services will run them for you. Do you want to keep your data in your network? You can download templates that will spin up
pre-configured RabbitMQ services in your own AWS environment. Perfectly great templates. There are also thousands of
resources to help you along the way. Perhaps more than AWS offers on its own.

You might want to move to Google Cloud or Azure. If you've developed the last five years
in Terraform, and leveraged container-based infrastructure, then you have nothing to lose! Tell your account rep
you're moving. Spin up a Kubernetes cluster in a new cloud, and point your helm charts at it. Go! When your account rep
quips back that it will take you too much work, tell them you've already spun up a proof of concept. They know that  
architecture built on Kubernetes isn't tricky to lift and shift. Watch your monthly costs go down or have enterprise
support given to you. You don't have this power if you're not architecting in a way that keeps you agile.

I cannot stress enough, move your workloads into a container.  Consider Kubernetes as a path forward. Leverage the
advantages of Dockerfiles instead of complicated AMIs. Remember, Kubernetes runs in any major cloud provider. AMIs don't.

## Multi-Region

Today, I amended my guidance from before. You must be in more than one regional data center. Not only that, but you should
consider running in multiple cloud providers. "But that's difficult!" you say. I know, I've seen it, I've heard it.
You're not wrong. My question is, are you making decisions today that make it less complicated as you advance? Are you
pushing back on using the next AWS service because you're already there? Are you asking your teams to consider, just
for a minute, if there are NON-AWS services that might be equally viable for you? Start with today, make tomorrow more manageable, and the rest of your services will follow in due time.

If you run your architecture in Kubernetes, you can run in Azure, Google Cloud, Digital Ocean,
AND AWS at the same time. You can round-robin your DNS into multiple Nginx ingress controllers and just be done.
You can update your DNS entries to remove an entire cloud provider from rotation. Although there are still some single
points of failure (i.e., your DNS system), we can begin minimizing the impact of a single cloud outage.

You don't have to solve all of the problems at once! Consider placing just your frontend systems into multiple
providers. Perhaps moving your API services into multiple providers works well too. Your database might be homed to a
single region for now. That's okay (for now).

## What can I do?

1. Make a decision that you'll require new architecture decisions to consider at least one non-AWS service instead
   of blindly accepting dependencies on services like SNS, SQS, S3, etc.


2. Bring on-board a database administrator. You use AWS RDS, so why would you need one? Finding the right DBA will help
   you become cloud-agnostic faster. The right DBA can set up a multi-region database and minimize your downtime. They can analyze your query syntax, index performance, security, and more when your database is stable.  Also, your DevOps/SRE/Platform
   team will thank you that they aren't answering database issues anymore.


3. Use custom-built libraries (npm packages, gems, crates, etc.) any (and every) time you call an AWS service. Create
   functions like `send_message` or `enqueue_work_item` that can be re-written in the future to support other cloud providers.
   Using a library will allow you to re-write a handful of functions and migrate large swaths of application pieces into new providers.
   This is one of the libraries you absolutely must have solid unit tests and mocking in! Don't compromise.


4. Start a journey towards Kubernetes. Kubernetes will run **anywhere**. Helm Charts make it easier to re-deploy your
   infrastructure in another cloud provider. Your account rep at AWS knows this too. This is a strategic advantage when
   negotiating contracts. If you're not working towards a fully containerized deployment model, your account reps have no
   reason to believe you'll move to another provider. You're locked in.


6. Ask for help. You're not in this alone. Your team wants to help, and your peers want to share their journey. Contractors
   want to help you.  Your problems are not unsolvable.  I'm willing to bet multiple other companies have solved
   similar issues before.


Even if you don't want to be a multi-cloud company, these questions will help you support higher availability metrics.
You can use the same mentality in a multi-region approach. Remember, if Kubernetes runs in multiple clouds, it also
runs across multiple regions.

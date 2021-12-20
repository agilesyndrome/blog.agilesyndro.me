---
title: "Do you really need redundancy in us-west-1?"
date: 2020-03-09T07:57:35-04:00
draft: false
layout: single
tags: [AWS, High Availability, Failover]
---

**Updated 2021-Dec-19**
[Yes, you should be in multiple-regions](https://agilesyndro.me/blog/yes-you-should-be-in-multiple-regions/)


I see this type of request in my office pretty often.  A customer calls or writes in with a proposal that looks almost like this: "I have my servers running in us-east-1, all behind a load balancer. Can you assist us with a failover setup in the us-west-1 region?"

**Yes, I most certainly can, but it probably isn't what you want.**

You run multiple EC2 instances, behind a load balancer or two.  Your health checks are set up properly.  Your RDS instance is set to be "Multi-AZ". Chances are, you're already running a highly available and fault-tolerant system that can recover quickly. 

Let's dig into the details, and find out if multi-region failover strategies are what you want.  To begin, we need to understand the difference between the terms "High Availability" or HA, and "Fault Tolerance". Your customers likely won't understand the difference when you create quotes, but in practice, there are large differences between what is expected between these two types of systems. Simply put, * customers should not notice the application performing badly in a fault-tolerant system*.  With high availability, customers may notice the underlying fault for a "moment" in time while the system heals itself, but it recovers without further customer interaction. Asking the customer to try something again is not HA! 

**You probably have a fault-tolerant system already.**

If you can terminate one of your load-balanced EC2 instances, and have some auto-scaling groups recover it, you're well on the path to checking the fault-tolerant box. Did the auto-scaling group notice it was missing and re-create it?  Did the application continue running without errors? If you said yes to both of those, you should send some kudos to your team for making a fault-tolerant system. 

*An AWS Region is made up of multiple physical data centers.* If your servers are already spread between multiple availability zones, you've got some isolation from total catastrophic failure! We can envision some reasons why all of us-east-1 would collapse, but if any of those scenarios play out, the earth likely has other issues to deal with beyond application failure. If you're 100% sure you still want multi-region strategies, the are two strategies to achieve this:

- Cold Strategy: Resources are provisioned, but remain cold with no traffic. In the event of a failover event, they become the active cluster

- Active Strategy: Resources are online at all times, and likely serve production traffic equally with other regions.

If you're okay with the Cold Strategy, you're chasing the wrong thing. I typically reject client proposals using this strategy and encourage clients to look at strengthening their existing single region strategy. Many places need to be looked at such as placement groups (did AWS place your servers on the same physical data rack?) and looking for other "single AZ" services that might be important to your overall strategy. 

If you're chasing the active strategy, my next question is about your containerization strategy.  *Are you using Kubernetes or Docker?  If not, let's get there first.* It's much easier to implement these kinds of strategies when we have containers we can re-deploy and have underlying container hosts that communicate on their own network. 

**Don't over-engineer.**

I encourage you to not undertake a multi-region AWS strategy until you're ready for it.

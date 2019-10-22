---
title: "1998 is calling, and it wants a website"
date: 2019-06-10T10:28:35-04:00
draft: false
layout: single
tags: [AWS, Cost Control]
---

It's 1998 and the local robotics club wants a website.  You've got this, you know HTML, some simple JavaScript and how to use Windows Paint to re-size images. The website design isn't the problem, it never really is.  Now comes the hard part, let's get our web server up and running:

* Red Hat 5.2
* Apache v1.3
* DNS A Record
* FTP Server for transfering the files

But let's not forget what you had to tell the team:

* __It's slow:__ Your images have to be small because your server isn't very powerful, but traffic should be light so performance shouldn't be an issue yet.
* __It's unreliable:__ The server might reboot for some patches, and your website will be down for a few minutes, but you'll try to make that happen at night or weekends. Honestly, you just might reboot the server because you fucked up something else and a reboot is the only way to fix it.
* __Your IP address changes:__ The website might go down if your Home IP address changes.  The team isn't paying you anything, and you don't want to pay big money to host the website somewhere else.  Your dynamic DNS script should take care of any changes within a 5-10 minute period.

## A better way

There has to be a better way, right? It's 2006 and along comes Amazon Web Services to save the day.  By 2008 GitHub is here too.  Let's look at a modern stack for a team website:

* Static files in GitHub
* Amazon S3 Bucket for public hosting
* Route 53 Domain Name
* CloudFront for Speed and Security (We've got HTTPS! Imagine doing that in 1998.)
* Perhaps even some Terraform to automate all the things.

Everybody wants a website.  Your friend owns a medical practice, your son's soccer team needs one, your neighbor's soap making business is booming.  You've got websites you manage, which isn't a problem, but suddenly your Amazon Web Services bill is $15+/month for websites you don't make any money on.  It's only a little bit of money, but that's okay. You don't mind.


## ... but does your wife know how much you spend at AWS?

It's not the storage costs at AWS that burn you, it's the add-on services. Here's my recent AWS bill for a few simple websites:

| AWS Service | Monthly Cost
:-------------|:------------------
__S3 Storage__ | $0.85/month
__Route 53 DNS__ | $8.06/month
__CloudWatch__ | $1.90/month
__CloudFront__ | $0.01/month
__HTTPS Certificates__ | $6.00/month

We're now at $16.82/month US Dollars for a few basic websites. In other words, thats $201.84 a year that could have been in my pocket. Ironically, the $1.90 I pay at CloudWatch is primrarily alarms to monitor that I haven't spent more at AWS than I want to.  Yes, they charge me to make sure I'm not spending too much.


## The Alternatives

There are some alternatives that I've found that work for me. Your mileage my very:

__GitHub Pages__ FREE Plan.  If you can manage to make this work, I suggest you do it.  It's free, and GitHub will host your page.  If you can't, you might need to continue eating the $0.85/month in storage costs, but it really isn't that bad. You don't need a private repo for your public website.  You've got nothing on that site that people can't scrape from the public internet anyway.

__CloudFlare__ FREE Plan.  This solves a multitude of issues.  Although I still register my domains at AWS Route 53 Domains, I now point the name servers over the CloudFlare to manage my DNS.  This saves me $0.50/month/domain as the CloudFlare DNS system is free.  It also doubles as my Logging & Metrics system, the Global CDN for speed, and HTTPS Certificates... all of which are given away in their free plan.

I'd like to say I'm bank rolling my $15/mo again, but I haven't finished moving the websites over yet.  I'll let you know what my next bill looks like once that's done.


## Shameless Plugs

* Like what you read today? Want to help me recover some of my AWS costs I lost? I'm coffee driven. [Buy me a coffee](https://ko-fi.com/agilesyndrome)
* Shout out to the old robotics team, still kicking it! [Children of the Swamp #179](https://www.thebluealliance.com/team/179)
* Sticking with S3 and CloudFront, that's cool, but you'll want something like [S3Stat](https://www.s3stat.com) to watch your log files.  I bet you didn't know your S3 logs had this much data in it. S3Stat made analytics easy. 

## Your thoughts?

What are your thoughts on alternatives to AWS?  Please leave me a comment and let me know what you use!


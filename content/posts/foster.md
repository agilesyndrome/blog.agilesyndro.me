---
title: "Foster"
date: 2019-06-30T14:15:29-04:00
draft: true
---

## The Backstory

My wife and I have struggled through infertility for over a decade.  We do have two beautiful boys living, but we claim eight others we lost to miscarriage.  We decided to adopt, two failed adoptions matches, and a significant financial loss later we moved away from private adoption agencies towards and into being foster parents.  We completed our application four days ago. It's difficult to explain what happened next to those who don't undertsand the foster care system, so I'm going to explain it to you like you write software... because if you're reading this blog, chances are you're in that field. 

## The Recruiter Phone Call

It's 12:45pm on a Friday, you're on the team retro meeting when a phone number you don't recongize calls you.  You send it to voicemail like you have the other 10 pieces of phone spam you got today.  Unlike all the others recruiters, this one sends you a text message. ```Hey please call me back asap. I have a job offer I need you to accept today.``` 

I call the recruiter back and hear that there's a 20-minute timer on this offer. She needs an answer, and needs one now.  The company I'd work for just fired their entire engineering department and they want to hire YOU as their one and only developer.  They have two products they support, some kind of website, and some kid of really early prototype of a worker-queue-based-thing.  The recruiter doesn't really know much more than that. You have 18 minutes. Oh, the worker queue app has some serious code-quality issues and is currently under attack by some hacker group.  The service died at least once but was revived, it's pretty much on the equivilent of life-support. You have 17 minutes to accept this offer.  I say yes, because no application should be left behind.

## The Waiting

For the next four hours I realize I forgot to ask some basic questions to the recruiter like, what language is the app written in?  What do these applications do? WHo are the customers? Does the company even have a name? I call the recruiter back, and they don't know but promise me that my Lyft is on the way and I'll get answers when I arrive at the office.  

## Day One

I'm in the office, and I log into my computer.  The security staff that escorted me into the building introduce me to the web-app by name. They say it's written half in Ruby and half in Java. I took two years of Java in high school, but it's been a while.  Hola Java. Let's see how much I remember.  I ask when I get to see the worker-queue app.  I'm told somebody will call me, sometime.  Getting acquainted with the web application,  my laptop runs Windows, but the Gems only compile on a Macbook successfully.  I reach for my wife who has a Macbook. It's a match made in heaven. She makes the web application run, deploys latest code, and has even found credentials to login.  I try again on my laptop, and upon looking at the Windows machine I'm running, the production stack crashes and burns, waiting for my wife to re-launch it again. This cycle repeats multiple times.  I've come to the stark conclusion, this app had something terrible happen to it, and it's deathly afraid of all machines that look anything remotely like the ancient version of Windows I run. 

## Day Two

I get a phone call about the worker-queue app.  It's a third-party software shop that has stepped in to keep the application running until I could get there.  They told me to meet them in their office, it's a 20 minute drive.  I arrive on-site only to be told I don't have the proper credentials to be on-site.  I'm almost escorted off the premisis by security when some random engineer says, oh, you're here for that app? Yeah, it's cool. I'll sign you in. I still have no idea what this application does, but I did learn the application name I was told isn't the actual name of the application, and the credentials I received need to be re-created.  

I've also learned today that the Web Application takes hibernates every day, sometimes twice a day.  Failure to hibernate the application will cause a serious melt-down of nuclear consequences.  The Web Application maintains a very un-predictable schedule, and does not conform to any best-practicesof a 2-year old Ruby app. Whoever developed this app previously was in some serious trouble, but on the plus side I found out the website has a really awesome feature that my own web-site never had. 

Oh, speaking of other websites, this position doesn't pay you anything. I'll be maintaining all of my other responsibilities , attempting to meet all previous deadlines (with a little bit of flex) while suddently learning two new sites, answering angry customer calls, and trying to figure out what it is I have on my hands.  I look at the ticket system I've been given access to.  In two years there are only 4 tickets created in the entire system, all of which were generated on Friday. Probably by the temporary staff members brought in during the great exodus of old staff. 
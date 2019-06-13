---
title: "13 Years later, and 'How was your day?' still terrifies both of us."
date: 2019-06-18T06:00:00-04:00
publishDate: "2019-06-18"
tags: [Love, Terraform, Ansible, Communication]
---

## 13 Years

Today is my 13th wedding anniversary.  Let me start by saying my wife is amazing. Like, I could make all of you jealous by talking about how awesome she is.  After 4,748 days of marriage though, the one question that still terrifies both of us is when she asks, "How was your day at work?" It goes one of two ways:

* I was successful in getting Packer to trigger some Ansible code that built an AMI that subsequently was launched by Terraform, all of which was triggered by a GitHub Pull Request monitored by Jenkins AND Concourse!" 
* I made computers do stuff that they don't normally do.

Can any of you relate to this?  I struggle to find the right words to help her relate to my day, but she tries really fucking hard to understand all of it for me.  The deer-in-the-headlight look is pretty common after I get off of work though.  First, let's address the elephant in the room - the deer in the headlight look is one I give myself all the damn time.  When a new message appears on the Slack channel, and I stare at it thinking "What the Fuck is `Widget Inc New Technology` and where the hell have I been?"  Things change so rapidly that even after being in this field 20+ years, I can't keep up with it myself.  There's really no way I can ask my wife to keep up either. 

Out of the blue one day she asked me, just what is Ansible and Terraform?  Here's the conversation that resulted:

**Me:** Let's say we live in a big house, and we have a lot of children, and lots of dogs. 

**Wife:** Okay, I'm liking this. 

**Me:** It's so big that we want every room of the house to have a robotic vacuum cleaner.

**Wife:** You can automate turning them all on, right? I wouldn't want to do that myself. 

**Me (thinking to myself):** Yes, she knows me very well.  There really isn't any piece of technology in my house I haven't at least attempted to automate.

**Me:** Yes, that's where Ansible and Terraform come in.  Let's say the house is dirty and it's time to clean up all those rooms.  With Ansible, you put the vacuums in each room. Ansible would keep an inventory of all the vacuums in the house, and turn them all on at once.  Terraform buys you several new vacuum cleaners from Amazon, unboxes them when they arrive, and turns them all on, one by one. 

**Wife:** So, Terraform does more, just slower? 

**Me:** Sometimes it does. Now imagine that the vacuum is full. You don't want to empty all of those things yourself.  Ansible will empty the vacuum every 30 minutes and make sure that it's got plenty of room to keep picking up all that dirt. Terraform sees the vacuum is full, throws it out, buys a new one from Amazon, unboxes it when it arrives, and turns the new one on.

**Wife:** Wow! Terraform must have a lot of money!

**Me:** Terraform actually makes all of those purchases using YOUR credit card.  Now let's say one of our children is sick with the flu and sneezes on the vacuum.  Ansible, at your service, wipes down your vacuum each night with disinfecting spray.  Terraform sees that a vacuum has a bit of flu-snot on it and, well, throws it out, buys you a new on from Amazon, unboxes it when it arrives, and turns the new one on. 

**Wife:** Terraform's got a one-track mind there.

**Me:** Something like that. Remember when the puppy had an accident in the house and the vacuum schmeared dog shit all over the house? 

**Wife:** Yeah, I threw that vacuum out. 

**Me:** Yup.  That's what you're supposed to do.  Terraform recognizes a vacuum is missing and buys a new one.  Ansible goes to turn on the vacuum cleaner the next time, blindly attempts to press the button that doesn't exist anymore, has an anxiety attack, and goes to the hospital. Ansible might wait patiently for you to put a new vacuum in the room on your own, your mileage may vary. Ansible and Terraform both have their place in our systems.


## What does it look like for you?

My wife is truly one of those special unicorns that were only supposed to exist in fairy tales.  She puts up with a lot of my technical disserations about my day.  She's been here through the great and not so great times.  I'm madly in love with you sweetheart! 

How does telling your significant other about your day go?  What are the challenges you face?

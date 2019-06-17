---
title: "What happened during the maintenance window..."
date: 2019-06-16T19:20:44-04:00
draft: true
---

## Epic Migration
It was one of those once-a-year crazy maintenance weekends.  You know the kind where we've got to take the whole stack down for a weekend while we migrate half a billion records from an old system to a shiny new one.  The kind where nobody wants to discuss the rollback strategy because it's as ugly as the upgrade.  Let me say a million things went right during this migration, and it goes down in the books as an epic success.  Nobody wants to read a blog post about success though, it's boring, beer was had, and the upgrade completed successfully. Tada.  I do want to talk about what we could have done better, and preface it with what my role in the upgrade was and why I still feel inclined to write about it.

We all work remotely. On the core upgrade team, we have developers who wrote the code and infrastructure engineers who spun up the new services. It's a great team, and the upgrade was in some of the most capable hands I've ever met.  I'm honored to work with them.  I work on the infrastructure team, but my role relates to the other systems that were not being touched this time around.  This upgrade was so large though, that management called an "all-hands-on-deck" signal and we were all ready to work all night to do whatever it took to make the magic happen. The rest of this post is my perspective of what could have been better, in an already successful migration. 

## Do you need me?

Friday afternoon rolls around. Those who had been planning the migration knew their tasks and had practiced multiple times.  The other engineers, myself included, started to realize nobody gave us any tasks to do. We were "on deck", ready and willing, with nothing assigned to us to do.  Do they need us on the call all night? Will they page us if they need us?  We speak up and ask.  We get some great news.  "Get some rest tonight, we'll probably need you Saturday morning." If we need you in the middle of the night, we'll reach out.  

Let me tell you, reach out is a remarkably vague term, and I'm a heavy sleeper.  What tone on my phone should I be listening to? A bit of discussion goes by about using Slack, E-Mail, Text Messages, Phone Calls, and finally we decide on the obvious choice - manually raising an "on-call" incident to reach those who are asleep. The on-call app can pretty much wake the dead three towns over.  We've all been woken up from its incessant text messaging, phone calls, and app notifications that seem to ring cacophonously on all my devices at once.  

I eventually sleep that night, but not very well. I'm constantly wondering what's going on, and when I should join the call.  Should I join the call on Saturday?  They said they'd page me if they need me.  When I wake up, Slack history tells me that the primary engineers took a small siesta and would get back together later, so I make a pot of coffee and have some breakfast.  I still don't know if I'm wanted in the war-room, but again, I'm waiting on the sidelines.  I read every Slack message that day, glued to my phone, ever non-present to my family and kids this weekend.

## Father's Day Weekend

Oh. You have family & kids?  Uhm, well... we kinda sorta scheduled the maintenance window right over Father's day. We didn't mean to, but it's just the one weekend that worked out between this issue or that issue. Truthfully we probably didn't look at the holiday schedule and see what day it was, but we are really sorry.  

As a reader, you should understand that my company values me and my family, and they show that consistently. I'm not mad they scheduled this over Father's day because they take such great care of me. I'm just shocked that my company who shows such careful regard to their employees would pick this weekend. We've been waiting a year to get this out the door, the time is finally here, so nobody complains (loudly).

Also, the Director of Infrastructure is out of the country, on a pre-scheduled family vacation, but you guys go ahead, you've practiced this. 

## The show must go on

I didn't plan on being a software engineer.  Much of my college degree is in theater technology. I was a stage monkey fixing issues as fast as they started. No matter what, the show must go on.  The technical director made sure all aspects of the technology could be fixed on the fly.  The stage manager ensured the understudies knew EVERYBODY's lines, and at one point I even watched the stage manager fill-in for a sick actor. You'd be surprised how fast the costume department can re-make an entire wardrobe. Nothing stops the theater show, and in the end, when the last curtain drops, the crowd is cheering, laughing, or crying. It's the best moment of the job. None of it would be possible if you didn't have people who think quickly on their feet. 

Back in software land, about halfway through this maintenance window the primary infrastructure engineer lost power at their house and switched to a cell-phone hotspot on laptop battery power. Crisis averted... until the laptop battery dies. Thinking to myself, I wonder who on my team is the secondary engineer for this system? I look at the infra ownership doc and... the secondary ownership field is blank. That's right folks, it's him or bust. We're currently migrating half a billion records from one system to another, and "Failure is not an option." We didn't have a clear plan for what would have happened if he wasn't available anymore.  The primary team did a magnificent job with his limited communication capacity, but the fear that **I** would somehow be selected to stand in for him was growing larger. I was sweating, and I hadn't even been called to step out of the sidelines.  I hadn't been involved in the rehearsal migrations.  I had a copy of the playbook that I read, but those are just words on paper.  I learn by doing, and I hadn't done yet. Nobody had asked me to, and I had somewhat stupidly assumed somebody else was already in that slot. Thankfully, the migration continued without much trouble, and I continued to read the Slack messages.

We prepare for system failure, but do we prepare for "people failure"? We all work remotely.  What if the lead developer's father had a heart attack? Perhaps a tornado is currently tearing its way through Raleigh. Children get sick, wives get angry, dogs run away, cars break down, hotspots fail, construction crews slice fiber, you name it, it happens. As an infrastructure engineer, I make redundancy a part of my job, but I realized my focus was on redundant technologies. I didn't call the flag on the play when there was no redundancy in the people involved this weekend.  
It could have been much worse for us.  

##I plan for a thing or two because I've seen a thing or two.  

You can't plan for everything, but you can have a plan for anything. I can recall a previous maintenance opportunity, the call was delayed an hour or two... because one of our developers lived on a farm, and somebody left the gate to the pasture open.  His cows were roaming down the street.  Yup. It's 2019 and we're delaying our software update because of some cows. 

Murphy will tell us that if it CAN go wrong, it will.  Your tools will also fail you.  Google will have a multi-regional outage and your conference bridge won't work.  Your pager system will fail and nobody will know your phone number.  (Do you have your team's numbers in your cellphone, or is that what Slack is for?) Slack will stop working (but just for some of your team.) Have multiple solutions for every tool involved. Keep those important passwords locally (encrypted) just in case your password management tool is down. 

## The TL;DR

**Do you need me?** This should not be a question any engineer should have to ask during a maintenance window.  Identify your primary engineers, your secondaries, the tertiaries if you need them.  Identify a solution that works to wake up people in the middle of the night.  Tell your secondaries, in no uncertain terms, if you expect them to join the war-room call, or if the should wait patiently for a page. 

**Schedule Wisely** Look at all the aspects of scheduling a maintenance window.  Consider staff availability and vacations, holidays, customer demands, time zones, and yes, please consider the weather too. It will be impossible to satisfy all of those domains at 100%, but if the window you select pisses off your engineers, you should probably add an extra day to the window because nobody will be at their best performance.

**Staff Redundancy** It's not every day that I say an Agile team needs comprehensive documentation, but let's face it.  We need more documentation around who owns what.  We're pretty clear that the primary owners of this upgrade will be on the call.  Without them, there is no call. You can't plan for all the disasters that might occur, but you can make sure you have primary, secondary, and even tertiary ownerships defined. Bring the secondaries into the rehearsal calls and make sure they feel confident standing in-place of their primary.  The secondary engineers should have written the playbook, or at least been able to. 

**Define your tools and your backup tools.** What tools will you use during the upgrade?  Does _EVERYBODY_ know what these tools are, and have credentials to them?  How will you page people late in the night?  What video conference system is the war-room using?  Where do we keep passwords? Keep a single document of tools used and make sure every tool has a backup.  Communicate changes to that document in a multi-modal format.  Something will fail you at the worst possible time, if people didn't get the information they need, your upgrade will be what fails. 

**Who is in charge?** In theater, you either report to the technical director or report to the stage manager. It's pretty much a decision of "is it on stage" or "off stage." You always know who to ask, and nobody else is authorized to make show altering decisions. If one of those two decision makers are out, the other person could take over both positions in a pinch.  Who owns your migration? Who is responsible for calling for a roll-back?  Who calls in the secondaries?  Who steps in if the director gets sick? Who keeps the maintenance window scope in-check? Have these discussions, and write down the answers ... and that's the best way to ensure you'll probably never need to use this knowledge. Murphy's Law hates a good plan.

It's been a long weekend, and if you're up for [buying me a coffee](https://ko-fi.com/agilesyndrome), I'd be forever grateful.

What's the most unexpected thing that's happened on your war-room calls? 


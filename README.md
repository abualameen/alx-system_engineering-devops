Postmortem Report: Web Stack Outage Incident 🚀

Introduction:
Welcome, brave reader, to the epic tale of our recent web stack saga. Join us as we unveil the mysteries behind our downtime adventure, sprinkled with a dash of wit and a visual delight for your technical taste buds.

Issue Summary:

Duration:
The web stack took an unscheduled break from 10:00 AM to 12:30 PM (UTC). Yes, our stack decided it was time for a short siesta.

Impact:
The authentication service played hard to get, resulting in 30% of users experiencing FOMO (Fear of Missing Out) on login attempts. Talk about an exclusive club!

Root Cause:
Turns out, our load balancer had a rebellious phase, rejecting valid authentication requests like a bouncer at a VIP party.

Timeline:

10:00 AM:

Detection: Our vigilant monitoring system screamed louder than an overexcited alarm clock on a Monday morning.
10:15 AM:

Investigation: Like detectives on a caffeine high, we assumed the servers were throwing a party. Investigated memory and CPU usage, but they were just sipping chamomile tea.
10:45 AM:

Misleading Path: We chased the elusive resource exhaustion dragon, only to find it was a mythical distraction.
11:00 AM:

Escalation: With no VIP access granted, we escalated the incident to our network infrastructure team. They were the SWAT team we needed.
11:30 AM:

Misleading Path: Network team briefly considered a DDoS attack, but it turned out our servers were just shy.
12:00 PM:

Resolution: Drumroll, please! Discovered and corrected the load balancer's rebellious misconfiguration, bringing back the party vibes.
Root Cause and Resolution:

Cause:
The load balancer decided it was too cool for school, rejecting authentication requests and causing mild chaos among our servers.

Resolution:
We had a heart-to-heart talk with the load balancer, straightened out its quirks, and restored order to the digital universe.

Corrective and Preventative Measures:

Improvements:

Implemented regular load balancer therapy sessions (a.k.a. audits).
Trained our monitoring system to spot rebellious load balancers from a mile away.
Tasks:

Load balancer therapy session (audit).
Monitor training program for vigilant alert systems.
Draft a heartfelt apology letter to the affected users (just kidding, but maybe not).
Note:
This postmortem extravaganza is brought to you by the README.md file within the "0x19-postmortem" directory of the GitHub repository "alx-system_engineering-devops."

We hope you enjoyed this rollercoaster ride through our web stack's wild day! 🎢🚀

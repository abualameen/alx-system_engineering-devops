This is a postmortem write as a project for the alxse programme


Postmortem Report: Web Stack Outage Incident

Issue Summary:

Duration:
The outage occurred from 10:00 AM to 12:30 PM (UTC).

Impact:
User authentication service downtime resulted in 30% login failures and delayed access for users.

Root Cause:
Misconfiguration in the load balancer settings led to rejection of valid authentication requests.

Timeline:

10:00 AM:

Detection: Automated monitoring alert on increased failed authentication attempts.
10:15 AM:

Investigation: Assumed server overload; focus on memory and CPU usage.
10:45 AM:

Misleading Path: Initial exploration of resource exhaustion led to a dead-end.
11:00 AM:

Escalation: Incident escalated to network infrastructure team.
11:30 AM:

Misleading Path: Network team explored potential DDoS attacks.
12:00 PM:

Resolution: Identified and corrected load balancer misconfiguration.
Root Cause and Resolution:

Cause:
Load balancer misconfiguration caused rejection of valid authentication requests.

Resolution:
Load balancer settings corrected to restore normal service functionality.

Corrective and Preventative Measures:

Improvements:

Regular load balancer configuration audits.
Enhanced monitoring for real-time alerts on authentication service performance.
Tasks:

Conduct load balancer configuration audit.
Implement additional monitoring for critical services.
Develop incident escalation protocol for efficient resolution.

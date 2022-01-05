---
title: Ceres Job Queue Fair-share Policy
description: Fair share policy
permalink: /guide/fairsharepolicy/
author: Jordan Hoosman
layout: page
---

Fair-share job scheduling only goes into effect when there are jobs waiting in the queue.

At submission each SLURM job is assigned a priority that may change while the job is in the queue and that depends on multiple factors, such as:

* Fair-share (based on how much resources have been consumed by the user’s jobs so far)
* Job Age (the length of time a job has been waiting in the queue, eligible to be scheduled)
* Job Size (the number of CPUs a job is allocated)

These factors have weights assigned to them. The fair-share factor has a much higher weight (10000) comparing to the weights for the other two factors (100 each). In addition all jobs older than 14 days have the same age factor. Assigning much higher weight to the fair-share factor allows to prioritize jobs of those users who have not used as many resources yet.

Users are allowed to use up to 400 cores across all their jobs at the same time (which is equivalent to 10 regular compute nodes) and up to 2TB of memory.

Edit: Based upon researcher input, the fair-share factor has been changed to 2000000, and the job age and job size factors have been changed to 1000. The usage half-life factor has been changed to 21 days down from 90 days.

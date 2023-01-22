# Administrative Setup

This directory contains all the scripts and automation to build out the workbench environment within Intersight.

Dedicated server administration roles for each student are created to give the perception of dedicated, isolate Cisco Intersight accounts for each student.  In reality, they are RBAC isolated logins within a host account.

Additionally, a shared organization with an example server profile (and all associated policies) is bound to the student roles as a READ ONLY privilege.

A resource group (list of devices/targets) are attached to each role - same set of devices for each student.  At this time, the labs don't actually apply profiles or policies to the devices but a server must be in the host account to consume a license and enable the functionality.

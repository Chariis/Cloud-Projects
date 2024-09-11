Gladchek Traffic Management on Azure

Project Overview
This project deploys Virtual machines and Web Apps across different regions (North Europe and East US 2). Traffic management is then implemented by distributing web app instances across the two regions, ensuring that if one region experiences an issue, the traffic is routed to the other region.

Table of Contents
- Azure Resources
- Prerequisites
- Steps to Deploy
- Traffic Management
- Contact

---

1. Azure Resources

The following resources are created:

A. Resource Group: A single resource group named `Gladchek Project` used to manage resources across regions.
B. Virtual Machines: used to test the different traffic routing methods.
   - `vm-northeurope` (North Europe)
   - `vm-eastus2` (East US 2)
C. App Service Plans:
   - `web-eastus2-plan` (East US 2)
   - `web-northeurope-plan` (North Europe)
D. Web Apps:
   - `Gladchek-eastus2-{RANDOM}{RANDOM}`
   - `Gladchek-northeurope-{RANDOM}{RANDOM}`
E. Network Security Group: NSG rules to allow RDP (Remote Desktop Protocol) access to the VMs.

---

2. Prerequisites

Ensure that the following are available and installed:
- Azure CLI
- An Azure account with appropriate permissions to create resources.
- Administrative access to configure NSGs, App Services, and VMs.

---

3. Steps to Deploy

Step 1: Create Resource Group
Create a resource group that will hold all the resources for the project.

Step 2: Define Admin Credentials
Set the admin credentials that will be used for the virtual machines.

Step 3: Create Virtual Machines
Create two Virtual Machines in different regions: North Europe and East US 2.

Step 4: Create App Service Plans
Create two App Service Plans for hosting the web apps in each region.

Step 5: Create Web Apps
Create two Web Apps, one in each region, and assign random names to ensure uniqueness.

---

4. Traffic Management
To implement traffic management, Azure Traffic Manager was used. This service allows for routing traffic based on performance, priority, or geographic location, ensuring that users are directed to the closest or best-performing endpoint.

Here’s how to integrate Traffic Manager:

- Set up Azure Traffic Manager profile.
- Configure DNS names for the web apps.
- Add both web app endpoints to the Traffic Manager profile.
- Test Traffic distribution between the two regions using the virtual machines located at different locations.

---

5. Contact
For any questions or assistance with the project, feel free to contact.

LinkedIn: https://www.linkedin.com/in/nnadi-charis-chigozie

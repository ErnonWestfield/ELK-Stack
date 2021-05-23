## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](https://github.com/HeavyWest/ELK-Stack/blob/main/Diagrams/ELK_Stack_Topology.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the DVMA_ELK_Deployment_playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

  - https://github.com/HeavyWest/ELK-Stack/blob/main/Ansible/yml_files/DVMA_ELK_Deployment_playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant and resistance to downtime, in addition to restricting unwanted access to the network.
- Load blancers protect against the possibilities of a DDos attacks which can disrupt the uptime of the traffic and servers. Loadbalancers ensure redundancy by ensure mulitiple VMs are available to share the traffic in such an attack or high traffic.
- A jump box is essential to add another layer of security where there is no direct access to the containers or servers. This creates a layer where containers can be accessed without creating a vulnerablility.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system files.
- Filebeat watches log data and files, then sents them to Elasticsearch or Logstash.
- Metricbeat collects system information from the OS and services running on the server.

The configuration details of each machine may be found below.

| Name                      | Function       | IP Address | Operating System             |
|---------------------------|----------------|------------|------------------------------|
| JumpBox-Offsec VM Ansible | Gateway        | 10.1.0.4   | Linux/UbuntuServer 18.04-LTS |
| Web1-OffSec               | Webserver      | 10.1.0.5   | Linux/UbuntuServer 18.04-LTS |
| Web2-OffSec               | Webserver      | 10.1.0.8   | Linux/UbuntuServer 18.04-LTS |
| Web3-OffSec               | Webserver      | 10.1.0.10  | Linux/UbuntuServer 18.04-LTS |
| ELK-VM                    | ELK/Monitoring | 10.2.0.4   | Linux/UbuntuServer 18.04-LTS |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox-Offsec machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 76.97.39.115

Machines within the network can only be accessed by JumpBox-Offsec.
- 10.1.0.4

A summary of the access policies in place can be found in the table below.

| Name                      | Publicly Accessible | Allowed IP Addresses   |
|---------------------------|---------------------|------------------------|
| JumpBox-Offsec VM Ansible | Yes                 | 76.97.39.115           |
| Web1-OffSec               | No                  | 10.1.0.4               |
| Web1-OffSec               | No                  | 10.1.0.4               |
| Web1-OffSec               | No                  | 10.1.0.4               |
| ELK-VM                    | Yes                 | 10.1.0.4, 76.97.39.115 |
| OffSecLoadBalancer        | Yes                 | 76.97.39.115           |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because there is very little effort in launching and deploying a network.
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:

Installs Docker.io
Installs pip3 & the Python Docker Module
Allows and executes an increase in Virtual Memory
Downloads & launches the ELK container image, then opens the appropriate ports
Enables that ELK runs every time the machine is booted

- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](https://github.com/HeavyWest/ELK-Stack/blob/main/Ansible/Resource_Files/Successful_Docker_Container.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:

Installed Filebeat & Metricbeat on each machine


- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:

Filebeat collects log data which allows us to monitor traffic on the devices.
Metricbeat collects data from servers such as OS data, CPU or memory data, or data about anything running on the server.

- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

Copy the Deployment-playbook.yml file to /etc/ansible/roles
Update the /etc/ansible/ansible.cfg file to include the remote_user=(USERNAME FOR ADMIN OF EACH VIRTUAL MACHINE)
Update the /etc/ansible/hosts file to include the IP address in the webservers & ELK groups. Make certain to uncomment the webservers selection & add the ELK section so it will work
Run the playbook, and navigate to 52.188.120.165:5601/app/kibana to check that the installation worked as expected.
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
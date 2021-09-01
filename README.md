# OCP static deployment
### Warning: This is beta version !!!  
I try writing ansible clearly and simply as I can for everyone.

## Requirement
- RHEL8.X and python3
- Ansible 2.8
- PXE mode require DHCP server (dnsmasq)

## New Features updated
- Supported multiple interface when deploy OCP
- Supported automatic add route when deploy OCP
- Generate ignition and iso file for add new worker nodes
- Supported bonding with multiple interface for add new worker nodes
- Supported bonding with multiple interface when deploy OCP
- Supported deploy on Bare-Metal with OCP 4.6 and 4.7 rhcos-live-iso
- Supported PXE boot menu for install OpenShift on Bare Metal
- Supported Add new master node 

## New Feature will update soon!!!
- Supported deploy on vSphere with OCP 4.6 and 4.7 rhcos-live-iso (Still on processes)
- Supported pxe boot menu for install OpenShift on vSphere
- Supported bonding with multiple interface for add new worker nodes for OCP 4.6 and up.

## Setup
- Config all variables in vars folder
- Put your pull secret to files/pull-secret.json

For OCP 4.5 and below.
- Choose setup_ocp_static_<bare_metal|vsphere>\_<multiple_interface>.yml for depoly OCP in your environment
<!--- - Change template for bare-metal or VMware in setup_ocp_static.yml at task "Create install-config.yaml file" -->

For OCP 4.6 and up.
- Choose live_setup_ocp_static_<bare_metal|vsphere>\_<multiple_interface>.yml for depoly OCP in your environment
- Choose live_menu_setup_ocp_static_bare_metal.yml for depoly OCP in your environment

## How to used
- Check ports on firewall is open

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook check_ports_open.yml```

- Check connection to whitelist url

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook check_whitelist_url.yml```

- Generate ignition file and iso for install OCP

For OCP 4.5 and below.<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bare Metal (ISO mode)<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook setup_ocp_static_bare_metal.yml -t <tags>```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vSphere (ISO mode)<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook setup_ocp_static_vsphere.yml -t <tags>```

For OCP 4.6 and up.<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bare Metal (PXE mode - boot menu)<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# setup_pxe_boot.sh```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook live_menu_setup_ocp_static_bare_metal.yml -t <tags>```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bare Metal (ISO mode)<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook live_setup_ocp_static_bare_metal.yml -t <tags>```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vSphere (ISO mode)<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook live_setup_ocp_static_vsphere.yml -t <tags>```

## Add new worker nodes
- Config all variables in add_ocp_static_worker_nodes.sh and vars/add_nodes_vars.yml|add_nodes_multiple_interface_vars.yml

For OCP 4.5 and below. (ISO mode)<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook add_ocp_static_worker_nodes.yml -t <tags>```

For OCP 4.6 and up. (PXE mode - boot menu and ISO mode)<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook live_menu_add_ocp_static_worker_nodes.yml -t <tags>```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook live_add_ocp_static_worker_nodes.yml -t <tags>```

## Add new master nodes
- Config all variables in add_ocp_static_master_nodes.sh and vars/add_master_nodes_vars.yml

For OCP 4.6 and up. (PXE mode - boot menu)<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```# ansible-playbook live_menu_add_ocp_static_master_nodes.yml -t <tags>```


## Note: 
- Recommend run with option -t \<tags\>
- All file will download to files directory

## Tested
- Deploy OCP 4.2.16 Bare-Metal ==> SUCCESS
- Deploy OCP 4.2.16 vSphere    ==> SUCCESS
- Deploy OCP 4.3.0 Bare-Metal ==> SUCCESS
- Deploy OCP 4.3.3 vSphere    ==> SUCCESS
- Deploy OCP 4.3.8 Bare-Metal ==> SUCCESS
- Deploy OCP 4.3.9 Bare-Metal ==> SUCCESS
- Deploy OCP 4.4.0-rc.11 bare-metal ==> SUCCESS
- Deploy OCP 4.4.3 Bare-Metal ==> SUCCESS
- Deploy OCP 4.5.5 vSphere    ==> SUCCESS
- Deploy OCP 4.5.7 Bare-Metal ==> SUCCESS
- Add new worker node with single and bonding interface on OCP 4.5.7 ==> SUCCESS
- Add new master node on OCP 4.6.8 ==> SUCCESS
- Deploy OCP 4.6.23 Bare-Metal ==> SUCCESS
- Deploy OCP 4.7.13 (UPI on RHOSP)  => SUCCESS

License
----

MIT

**Free Software and Bugs, Hell Yeah!**


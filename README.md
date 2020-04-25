# OCP static deployment
### Warning: This is beta version !!!  
I try writing ansible clearly and simply as I can for everyone.
## setup
- Config all variables in vars folder
- Put your pull secret to files/pull-secret.json
- Change template for bare-metal or VMware in setup_ocp_static.yml at task "Create install-config.yaml file"

## How to used
- Check ports on firewall is open

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\# ansible-playbook check_ports_open.yml

- Check connection to whitelist url

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\# ansible-playbook check_whitelist_url.yml

- Generate ignition file and iso for install OCP

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bare Metal<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\# ansible-playbook setup_ocp_static_bare_metal.yml -t \<tags\>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vSphere<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\# ansible-playbook setup_ocp_static_vsphere.yml -t \<tags\>

Note: 
- Recommend run with option -t \<tags\>
- All file will download to files directory

## Tested
- Tested on RHEL8.X and python3
- Deploy OCP 4.2.16 bare-metal ==> SUCCESS
- Deploy OCP 4.2.16 vSphere    ==> SUCCESS
- Deploy OCP 4.3.0 bare-metal ==> SUCCESS
- Deploy OCP 4.3.3 vSphere    ==> SUCCESS
- Deploy OCP 4.3.8 bare-metal ==> SUCCESS
- Deploy OCP 4.3.9 bare-metal ==> SUCCESS
- Deploy OCP 4.4.0-rc.11 bare-metal ==> SUCCESS

License
----

MIT

**Free Software and Bugs, Hell Yeah!**


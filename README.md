# OCP static deployment
### Warning: This is beta version !!!  
I try writing ansible clearly and simply as I can for everyone.
## setup
- Config all variables in vars folder
- Put your pull secret to files/pull-secret.json
- Change template for bare-metal or VMware in setup_ocp_static.yml at task "Create install-config.yaml file"

## How to used
- Check ports on firewall is open

\# ansible-playbook check_ports_open.yml

- Check connection to whitelist url

\# ansible-playbook check_whitelist_url.yml

- Generate ignition file and iso for install OCP

\# ansible-playbook setup_ocp_static.yml

Note : When you run setup_ocp_static.yml all file will download to files directory

## Tested
- deploy ocp 4.2.16 bare-metal ==> SUCCESS
- deploy on VMware ==> Developing and Testing

License
----

MIT

**Free Software and Bugs, Hell Yeah!**


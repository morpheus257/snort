# Snort
#
A Snort project provided with Vagrant.
#
Goal I want to achive is type "Vagrant up" and obtain a full working server with installed and configured snort.
#
Match is starting....
Enjoy!
#
#
#
UPDATE:
#
When you'll run VM, a script.sh file will be imported in your VM and it will be runned, it will install for you all dependencies and softwares you'll need.
#
After this, Vagrant will import in your VM a modified version of snort.conf. Only thing you must do it's to modify some paramethers to reflect your network...
#
Follow this steps!
#
Open the configuration file in your favorite text editor, for example using nano (installed in VM) with the command below.
#
sudo nano /etc/snort/snort.conf
#
Find these sections shown below in the configuration file and change the parameters to reflect the examples here.
#
# Setup the network addresses you are protecting
ipvar HOME_NET <server public IP>/32
#
# Set up the external network addresses. Leave as "any" in most situations
ipvar EXTERNAL_NET !$HOME_NET
#
# Path to your rules files (this can be a relative path)  --> DONE
var RULE_PATH /etc/snort/rules
var SO_RULE_PATH /etc/snort/so_rules
var PREPROC_RULE_PATH /etc/snort/preproc_rules
#
# Set the absolute path appropriately  --> DONE
var WHITE_LIST_PATH /etc/snort/rules
var BLACK_LIST_PATH /etc/snort/rules
In the same snort.conf file, scroll down to the section 6 and set the output for unified2 to log under filename of snort.log like below.
#
# unified2
# Recommended for most installs  --> DONE
output unified2: filename snort.log, limit 128
#
Lastly, scroll down towards the bottom of the file to find the list of included rule sets. You will need to uncomment the local.rules to allow Snort to load any custom rules.  --> DONE
#
include $RULE_PATH/local.rules
#
#
If you are using the community rules, add the line underneath to your ruleset as well, for example just below your local.rules line.  --> DONE
#
include $RULE_PATH/community.rules
#
Once you are done with the configuration file, save the changes and exit the editor.

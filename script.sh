#
# Daq installation in /opt/ folder
#
cd /opt
wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
tar -xvzf daq-2.0.6.tar.gz
cd daq-2.0.6
./configure && make && sudo make install
#
# Snort installation in /opt/ folder
#
cd /opt
wget https://www.snort.org/downloads/snort/snort-2.9.11.1.tar.gz
tar -xvzf snort-2.9.11.1.tar.gz
cd snort-2.9.11.1
./configure --enable-sourcefire && make && sudo make install
#
# Create "snort" user and group and change authorization
#
sudo ldconfig
sudo ln -s /usr/local/bin/snort /usr/sbin/snort
sudo groupadd snort
sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort
sudo mkdir -p /etc/snort/rules
sudo mkdir /var/log/snort
sudo mkdir /usr/local/lib/snort_dynamicrules
sudo chmod -R 5775 /etc/snort
sudo chmod -R 5775 /var/log/snort
sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules
sudo chown -R snort:snort /etc/snort
sudo chown -R snort:snort /var/log/snort
sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules
#
# Create rules folder with whute and black list
#
sudo touch /etc/snort/rules/white_list.rules
sudo touch /etc/snort/rules/black_list.rules
sudo touch /etc/snort/rules/local.rules
sudo cp /opt/snort-2.9.11.1/etc/*.conf* /etc/snort
sudo cp /opt/snort-2.9.11.1/etc/*.map /etc/snort
#
# Download and install Snort Community rules
#
wget https://www.snort.org/rules/community -O ~/community.tar.gz
#
# Extract the rules and copy them in your configuration folder
#
sudo tar -xvf ~/community.tar.gz -C ~/
sudo cp ~/community-rules/* /etc/snort/rules
#
# By default, Snort on Ubuntu expects to find a number of different rule files which
# are not included in the community rules. You can easily comment out the unnecessary
# lines using the sed command underneath.
# If you need, uncomment the follow line.
# 
# sudo sed -i 's/include \$RULE\_PATH/#include \$RULE\_PATH/' /etc/snort/snort.conf
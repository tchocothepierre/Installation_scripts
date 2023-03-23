apt-get update -y

echo "Install Java"
apt-get install openjdk-8-jdk -y
java -version

echo "Install Nexus"
useradd -M -d /opt/nexus -s /bin/bash -r nexus
echo "nexus ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nexus
mkdir /opt/nexus
wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.29.2-02-unix.tar.gz
tar xzf nexus-3.29.2-02-unix.tar.gz -C /opt/nexus --strip-components=1
chown -R nexus:nexus /opt/nexus

nano /opt/nexus/bin/nexus.vmoptions


# in the file "vi /opt/nexus/bin/nexus.vmoptions" replace ../sonatype by ./sonatype

# uncomment the line in the file "vi /opt/nexus/bin/nexus.rc" and add the user "nexus" 

# start nexus : 
sudo -u nexus /opt/nexus/bin/nexus start 

# default port of nexus is 8081


```
https://www.howtoforge.com/how-to-install-and-configure-nexus-repository-manager-on-ubuntu-20-04/
```

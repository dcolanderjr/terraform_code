#!/bin/bash

sleep 360

sudo apt update
sudo apt upgrade

sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

JENKINS_SETUP_SCRIPT=$(cat <<EOF
#!/bin/bash

sudo apt update
sudo apt install -y openjdk-17-jre fontconfig curl

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins

sudo tee /etc/systemd/system/jenkins.service > /dev/null <<SERVICE_EOF
[Unit]
Description=Jenkins Automation Server
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/java -jar /usr/share/jenkins/jenkins.war
User=jenkins
Group=jenkins
Restart=always

[Install]
WantedBy=multi-user.target
SERVICE_EOF

sudo systemctl daemon-reload

sudo systemctl start jenkins

echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword > /home/ubuntu/jenkins_password.txt

sudo sed -i '/^#PubkeyAuthentication/s/^#//' /etc/ssh/sshd_config
sudo sed -i '/^#AuthorizedKeysFile/s/^#//' /etc/ssh/sshd_config

sudo ssh-keygen -t rsa -b 4096 -C "dcolanderjr@gmail.com" -f /home/ubuntu/jenkins_key.txt

EOF
)

JENKINS_SETUP_SCRIPT_FILE="/tmp/setup_jenkins.sh"
echo "$JENKINS_SETUP_SCRIPT" > "$JENKINS_SETUP_SCRIPT_FILE"

chmod +x "$JENKINS_SETUP_SCRIPT_FILE"

"$JENKINS_SETUP_SCRIPT_FILE"

rm "$JENKINS_SETUP_SCRIPT_FILE"

sudo apt  install -y python3-pip
sudo apt install awscli

sudo cat /sshd_config > /etc/ssh/sshd_config

sudo rm -f /var/lib/cloud/instance/user-data.txt

sudo hostnamectl set-hostname jenkins-dev
sudo init 6



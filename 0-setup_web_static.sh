#!/usr/bin/bash
#Bash script that sets up your web servers for the deployment of web_static

#install nginx

sudo apt-get update && sudo apt-get upgrade
sudo install nginx
sudo ufw allow 'nginx full'

# create the directories

sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo echo '<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>' > /data/web_static/releases/test/index.html

#link directory

if [ -d "/data/web_static/current" ];
then
    echo "/data/web_static/current already exists"
    sudo rm -rf /data/web_static/current;
fi;
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

# change user

sudo chown -hR $USER:$USER /data/

#update nginx config

sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default

sudo ln -sf '/etc/nginx/sites-available/default' '/etc/nginx/sites-enabled/default'

#restart nginx

sudo service nginx restart

echo -e "\e[1;32m SUCCESS!!!\e[0m"

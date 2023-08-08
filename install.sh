sudo su
apt install git ca-certificates -y
#!/bin/bash
apt-cdrom add
echo "deb cdrom:[OS Astra Linux 1.6 smolensk-devel - amd64 DVD]/ smolensk contrib main non-free
deb cdrom:[OS Astra Linux 1.6 smolensk - amd64 DVD ]/ smolensk contrib main non-free
deb http://nginx.org/packages/debian/ wheezy nginx " > /etc/apt/sources.list
apt update -y
apt upgrade -y
apt-get install build-essential curl wget apt-transport-https -y
apt install php php-fpm  -y
systemctl stop apache2
systemctl disable apache2
unzip nginx.zip
dpkg -i nginx/*.deb
echo "server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html;
        server_name _;

        location ~ \.php$ {
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
            fastcgi_index index.php;
            include fastcgi.conf;
    }
        location / {
                try_files $uri $uri/ =404;
        }
}
" > /etc/nginx/sites-enabled/default

echo " <?php phpinfo() ?>" > /var/www/html/index.php
systemctl restart nginx
dpkg -i code.deb
bash node.sh
apt install npm nodejs -y
npm install vue
npm install vite
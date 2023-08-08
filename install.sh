sudo su
apt install git -y
apt-cdrom add
echo "deb cdrom:[OS Astra Linux 1.6 smolensk-devel - amd64 DVD]/ smolensk contrib main non-free
deb cdrom:[OS Astra Linux 1.6 smolensk - amd64 DVD ]/ smolensk contrib main non-free
deb http://nginx.org/packages/debian/ wheezy nginx " > /etc/apt/sources.list
apt update -y
apt upgrade -y
apt-get install build-essential curl ca-certificates wget apt-transport-https -y
apt install php php-fpm  -y
systemctl stop apache2
systemctl disable apache2
wget https://nextcloud.astralinux.ru/s/qKaC9yiH342MTx8/download/nginx.zip
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
dpkg -i code.deb
curl -fsSL https://deb.nodesource.com/setup_16.x -o node.sh
sed -i 's/orel/smolensk/g' node.sh
bash node.sh
apt install npm nodejs -y
npm install vue
npm install vite
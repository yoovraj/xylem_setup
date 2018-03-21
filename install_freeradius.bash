git clone https://github.com/FreeRADIUS/freeradius-server.git

yum install libtalloc-devel -y

./configure --prefix=/usr/local/radius

configure: WARNING: kqueue library not found. Use --with-kqueue-lib-dir=<path>.
yum -y install wget automake autoconf libtool rpm-build


configure: error: failed linking to libcrypto. Use --with-openssl-lib-dir=<path>, or --with-openssl=no (builds without OpenSSL)


checking for mysql_init in -lmysqlclient in /usr/local/lib/mysql... no
checking for mysql_init in -lmysqlclient in /usr/local/mysql/lib/mysql... no
checking for mysql_init in -lmysqlclient... no
checking for mysql_init in -lmysqlclient in /usr/local/lib... no
checking for mysql_init in -lmysqlclient in /opt/lib... no
configure: WARNING: MySQL libraries not found. Use --with-mysql-lib-dir=<path>.
checking for mysql.h (using mysql_config --cflags)... no
checking for mysql.h (using mysql_config --include)... no
checking for mysql/mysql.h in /usr/local/include/... no
checking for mysql/mysql.h in /usr/local/mysql/include/... no
checking for mysql/mysql.h... no
checking for mysql/mysql.h in /usr/local/include/... no
checking for mysql/mysql.h in /opt/include/... no
configure: WARNING: MySQL headers not found. Use --with-mysql-include-dir=<path>.
configure: WARNING: silently not building rlm_sql_mysql.
configure: WARNING: FAILURE: rlm_sql_mysql requires: libmysqlclient || libmysqlclient_r mysql.h.

yum install mysql mysql-devel mysql-lib



radtest {USERNAME} {PASSWORD} localhost 0 {SECRETKEY}


https://emandeguzman.wordpress.com/2012/10/24/creating-a-capture-portal-using-coovachilli-freeradius-and-mysql/

apt-get install build-essential
apt-get install net-tools
sudo apt-get install autotools-dev
sudo apt-get install automake


gengetopt command not found
apt-get install gengetopt






Debian GNU/Linux 8 (Jessie)

sudo apt-get install build-essential
sudo apt-get install net-tools
sudo apt-get install autotools-dev
sudo apt-get install automake
sudo apt-get install gengetopt
sudo apt-get install git
sudo apt-get install aptitude

git clone https://github.com/FreeRADIUS/freeradius-server.git

cd freeradius-server;pwd
./configure --prefix=/usr/local/radius

---
configure: WARNING: talloc library not found. Use --with-talloc-lib-dir=<path>.
---
aptitude search talloc
sudo apt-get install libtalloc-dev

---
configure: WARNING: kqueue library not found. Use --with-kqueue-lib-dir=<path>.
---

aptitude search libkqueue
sudo apt-get install libkqueue-dev libkqueue0


sudo aptitude install mysql-server
sudo aptitude search libmysqlclient
sudo apt-get install libmysqlclient-dev


./configure --prefix=/usr/local/radius --with-openssl=no


JSON interface
http://192.168.10.1:3990/json/status

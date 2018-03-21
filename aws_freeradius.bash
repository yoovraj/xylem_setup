Very good documentation links
https://networkradius.com/doc/current/introduction/RADIUS.html
https://wiki.freeradius.org/guide/Getting%20Started

yum update

sudo yum groupinstall 'Development Tools'

mkdir work
cd work;pwd
git clone https://github.com/FreeRADIUS/freeradius-server.git

sudo mkdir /usr/local/freeradius
cd /usr/local/freeradius; pwd
# this works properly
git clone v3.0.x


./configure --prefix=/usr/local/freeradius --with-openssl=no


sudo yum localinstall

yum repolist enabled | grep mysql


# Files :
# https://wiki.freeradius.org/guide/Getting%20Started
vi raddb/mods-config/files/authorize
---
testing Cleartext-Password := "password"
---


vi etc/raddb/clients.conf
---
client localhost_ipv6 {
        ipv6addr        = ::1
        secret          = testing123
}
---


vi etc/raddb/clients.conf
---
client localhost {
        #  Only *one* of ipaddr, ipv4addr, ipv6addr may be specified for
        #  a client.
        #
        #  ipaddr will accept IPv4 or IPv6 addresses with optional CIDR
        #  notation '/<mask>' to specify ranges.
        #
        #  ipaddr will accept domain names e.g. example.org resolving
        #  them via DNS.
        #
        #  If both A and AAAA records are found, A records will be
        #  used in preference to AAAA.
        ipaddr = 127.0.0.1

        #  Same as ipaddr but allows v4 addresses only. Requires A
        #  record for domain names.
        ipv4addr = *    # any.  127.0.0.1 == localhost
}
---

# mysql
# https://wiki.freeradius.org/guide/SQL-HOWTO-for-freeradius-3.x-on-Debian-Ubuntu
mysql -uroot -p radius <   etc/raddb/mods-config/sql/main/mysql/setup.sql
mysql -uroot -p radius <   etc/raddb/mods-config/sql/main/mysql/schema.sql

cd etc/raddb/mods-enabled/
ln -s ../mods-available/sql sql

ls -la sql
lrwxrwxrwx 1 root root 21 Mar 13 13:35 sql -> ../mods-available/sql



vi etc/raddb/sites-available/default
---
#sql
>>
sql
---

mysql -u radius -p
>  use radius;
>  insert into radcheck (username,attribute,op,value) values("fredf", "Cleartext-Password", ":=", "wilma");


vi etc/raddb/mods-available/sql
---
driver = "rlm_sql_mysql"
dialect = "mysql"
---




AWS security group
Custom UDP Rule : 1812 1813

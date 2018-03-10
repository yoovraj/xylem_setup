# mac server
## start mysql before running freeradius
mysqld

# confirm the mysql
 mysql -uroot

show databases;
-----------
| radius             |
-----------

use radius ;
show tables;
+------------------+
| Tables_in_radius |
+------------------+
| nas              |
| radacct          |
| radcheck         |
| radgroupcheck    |
| radgroupreply    |
| radpostauth      |
| radreply         |
| radusergroup     |
+------------------+

select * from radcheck;
select * from radacct;

cd /usr/local/freeradius/;pwd
sudo ./sbin/radiusd -X
-----------
Listening on auth address * port 1812 bound to server default
Listening on acct address * port 1813 bound to server default
Listening on auth address :: port 1812 bound to server default
Listening on acct address :: port 1813 bound to server default
Listening on auth address 127.0.0.1 port 18120 bound to server inner-tunnel
Listening on proxy address * port 59735
Listening on proxy address :: port 59736
Ready to process requests
-----------




### CLIENT check (coova chilli)
ssh 192.168.2.9 -lpi

cd /usr/local/chilli; pwd
sudo ./etc/init.d/chilli start
### confirm log on server side freeradius
-------
(0) Received Accounting-Request Id 0 from 192.168.2.9:55235 to 192.168.2.1:1813 length 181
(0)   ChilliSpot-Version = "1.4"
.
.
.
.
rlm_sql (sql): Opening additional connection (7), 1 of 31 pending slots used
rlm_sql_mysql: Starting connect to MySQL server
rlm_sql_mysql: Connected to database 'radius' on Localhost via UNIX socket, server version 5.7.19, protocol version 10
(0)     [sql] = noop
(0)     [exec] = noop
(0) attr_filter.accounting_response: EXPAND %{User-Name}
(0) attr_filter.accounting_response:    -->
(0)     [attr_filter.accounting_response] = noop
(0)   } # accounting = ok
(0) Sent Accounting-Response Id 0 from 192.168.2.1:1813 to 192.168.2.9:55235 length 0
(0) Finished request
(0) Cleaning up request packet ID 0 with timestamp +101
Ready to process requests
-------


## connect device wifi to XYLEM_NETWORK
--------
(1) Received Access-Request Id 21 from 192.168.2.9:37705 to 192.168.2.1:1812 length 308
(1)   ChilliSpot-Version = "1.4"
(1)   User-Name = "yoovraj"
.
.
.
(2)   } # accounting = updated
(2) Sent Accounting-Response Id 1 from 192.168.2.1:1813 to 192.168.2.9:55235 length 0
(2) Finished request
(2) Cleaning up request packet ID 1 with timestamp +306
Waking up in 4.9 seconds.
(1) Cleaning up request packet ID 21 with timestamp +306
--------


## confirm database update
select * from radacct;
mysql> select * from radacct where radacctid = 6\G;
*************************** 1. row ***************************
         radacctid: 6
     acctsessionid: 152064812100000002
      acctuniqueid: 5de9ab71f726736ef69daa0947d9b182
          username: yoovraj
         groupname:
             realm:
      nasipaddress: 192.168.10.1
         nasportid: 00000002
       nasporttype: Wireless-802.11
     acctstarttime: 2018-03-10 11:20:57
    acctupdatetime: 2018-03-10 11:25:59
      acctstoptime: NULL
      acctinterval: 302
   acctsessiontime: 302
     acctauthentic:
 connectinfo_start:
  connectinfo_stop:
   acctinputoctets: 6518038
  acctoutputoctets: 433233
   calledstationid: B8-27-EB-41-67-CB
  callingstationid: 58-7F-57-B8-C2-3B
acctterminatecause:
       servicetype:
    framedprotocol:
   framedipaddress: 192.168.10.2
1 row in set (0.00 sec)




------ Insert data

insert into radcheck (username, attribute, op, value) values ("siddharth", "Cleartext-Password", ':=', "pillai");

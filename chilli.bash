Manual :
https://dlscrib.com/queue/howto-install-coovachilli-on-a-raspberry-pi-using-raspian-freeradius-and-mysql-v1_58fcdb53dc0d604a63959e7c_pdf?queue_id=5a2da697e2b6f5186e8c2fc9


wget "https://github.com/coova/coova-chilli/archive/1.4.tar.gz"
tar -xzvf 1.4.tar.gz
cd coova-chilli-1.4;

sh bootstrap
./configure --prefix=/usr/local --enable-miniportal
make



iptables -I POSTROUTING -t nat -o $HS_WANIF -j MASQUERADE
iptables -I POSTROUTING -t nat -o \$HS_WANIF -j MASQUERADE >> ipup.sh

wget "https://github.com/coova/coova-chilli/archive/1.3.2.tar.gz"

./configure --prefix=/usr --mandir=\$${prefix}/share/man --infodir=\$${prefix}/share/info \
--sysconfdir=/etc --localstatedir=/var --enable-largelimits \
--enable-binstatusfile --enable-statusfile --enable-chilliproxy \
--enable-chilliradsec --enable-chilliredir --with-openssl \
--with-poll --enable-dhcpopt --enable-sessgarden --enable-dnslog \
--enable-ipwhitelist --enable-redirdnsreq --enable-miniconfig \
--enable-libjson --enable-layer3 --enable-proxyvsa --enable-miniportal \
--enable-chilliscript --enable-eapol --enable-uamdomainfile \
--enable-modules --enable-multiroute



v1,4 :
./configure --prefix=/usr/local/chilli --enable-largelimits \
--enable-binstatusfile --enable-statusfile --enable-chilliproxy \
--enable-chilliradsec --enable-chilliredir --with-openssl \
--with-poll --enable-dhcpopt --enable-sessgarden \
--enable-ipwhitelist --enable-redirdnsreq --enable-miniconfig \
--enable-libjson --enable-layer3 --enable-proxyvsa --enable-miniportal \
--enable-chilliscript --enable-eapol --enable-uamdomainfile \
--enable-modules --enable-multiroute --enable-json
--enable-dnslog






# put this to ignore error
export CFLAGS="-Wno-error"
# minimal installation
./configure --prefix=/usr/local/chilli --enable-miniportal --enable-libjson --enable-json








----------------------------------------------------
des_set_odd_parity((des_cblock *)des_key);

DES_cblock -> correct one
ms_chap.c: In function 'MakeKey':
ms_chap.c:99:3: error: implicit declaration of function 'des_set_odd_parity' [-Werror=implicit-function-declaration]
   des_set_odd_parity((DES_cblock *)des_key);
   ^~~~~~~~~~~~~~~~~~
ms_chap.c: In function 'DesEncrypt':
ms_chap.c:106:3: error: unknown type name 'des_key_schedule'
   des_key_schedule key_schedule;
   ^~~~~~~~~~~~~~~~
ms_chap.c:109:3: error: implicit declaration of function 'des_set_key' [-Werror=implicit-function-declaration]
   des_set_key(&des_key, key_schedule);
   ^~~~~~~~~~~
ms_chap.c:110:3: error: implicit declaration of function 'des_ecb_encrypt' [-Werror=implicit-function-declaration]
   des_ecb_encrypt((DES_cblock *)clear, (DES_cblock *)cipher, key_schedule, 1);
   ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors



1.4
garden.c: In function 'garden_print_appconn':
garden.c:77:5: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
     if (!safe_write(fd, line, strlen(line))) /* error */;
     ^~
garden.c:83:7: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'if'
       garden_print_list(fd,
       ^~~~~~~~~~~~~~~~~
----------------------------------------------------


# remove group writable bit (/usr/local)
chmod g-w filename


killproc not found (include lsb/init-functions in the chilli init )
vi /etc/init.d/chilli
. /lib/lsb/init-functions

# copy defaults to chilli
cp etc/chilli/defaults etc/chilli/config

# for kilproc function
vi ./etc/init.d/chilli
----
. /lib/lsb/init-functions
----

### Radius attributes
https://ignitenet.uservoice.com/knowledgebase/articles/933507-what-are-the-supported-radius-attributes-in-coovac



/sbin/start-stop-daemon --stop --exec  /usr/local/chilli/sbin/chilli

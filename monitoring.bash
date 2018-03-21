/usr/local/chilli/sbin/chilli_query list > data/ip.csv

# set crontab in root
crontab -e
* * * * * cd /usr/local/chilli; ./sbin/chilli_query list > ./data/ip.csv




# python api
python --version
pip --version
pip install flask
pip install flask-restful
pip install flask-jsonpify



wget "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip"
pi@raspberrypi:~/work/api $ ./ngrok authtoken xxxx
Authtoken saved to configuration file: /home/pi/.ngrok2/ngrok.yml

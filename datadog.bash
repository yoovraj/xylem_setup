Step-by-step Installation
1 Set up apt so that it can download through https:

sudo apt-get update
sudo apt-get install apt-transport-https
2 Set up the Datadog deb repo on your system and import Datadog's apt key:

sudo sh -c "echo 'deb https://apt.datadoghq.com/ stable 6' > /etc/apt/sources.list.d/datadog.list"
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 382E94DE
3 Update your local apt repo and install the Agent:

sudo apt-get update
sudo apt-get install datadog-agent
4 Copy the example config into place and plug in your API key (8ea217fb5ae4369bd6a63050cf6803e7):

sudo sh -c "sed 's/api_key:.*/api_key: xxx/' /etc/datadog-agent/datadog.yaml.example > /etc/datadog-agent/datadog.yaml"
5 Start the Agent with Ubuntu 16.04 and higher:

sudo systemctl restart datadog-agent.service
5 Start the Agent with Ubuntu 14.04:

sudo initctl start datadog-agent

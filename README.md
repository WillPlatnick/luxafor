# luxafor

This is just a repo I setup to help me manage my luxaflor flag/git status. It is completely unsupported, as it's mostly just here for my own use.

Workflow:
* If I put do not disturb mode on my mac: set dnd on slack, set slack status, turn flag red
* If I'm in a Zoom meeting, set slack status, turn flag red
* If I'm in a Slack meeting, set slack status, turn flag red
* When these conditions clear, turn flag green, reset slack status


## Setup

```bash
npm install --global do-not-disturb-cli # get macos dnd status
go get -v -u github.com/leosunmo/goluxafor/example/luxcli # control lux flag
brew install rockymadden/rockymadden/slack-cli # talk to Slack
brew install supervisor # Run script as service
brew services start supervisor
mkdir /usr/local/etc/slack-cli
mkdir -p /usr/local/etc/supervisor.d/
sudo /usr/bin/pip3 install pyobjc-framework-Quartz
slack init
```

/usr/local/etc/supervisor.d/luxafor.ini contents

```
[program:luxafor]
directory=/Users/williamplatnick/workspace/luxafor
command=/Users/williamplatnick/workspace/luxafor/lux.sh
startsecs=0
user=williamplatnick
autorestart=true
environment= PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/williamplatnick/.go/bin"
stdout_logfile=/Users/williamplatnick/workspace/luxafor/lux.log
stderr_logfile=/Users/williamplatnick/workspace/luxafor/lux_error.log
brew services restart supervisor
```

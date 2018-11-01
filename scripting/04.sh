#!/bin/bash
md5sum /etc/crontab > /root/newsum
if [ -f /root/oldsum ]
then
  if [ "$(diff /root/newsum /root/oldsum)" != "" ]
  then echo "/etc/crontab was changed" | mail -s "Crontab changed" root
  fi
fi
cp /root/newsum /root/oldsum

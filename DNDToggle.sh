#!/bin/bash

dndEnabled=`defaults -currentHost find dndStart`
if [[ -z "$dndEnabled" ]]
	then
		dndStart=`date "+%H:%M" | awk -F: '{ print ($1 * 60) + $2}'`
		dndEnd=`date -v+3H "+%H:%M" | awk -F: '{ print ($1 * 60) + $2}'`
		defaults -currentHost write com.apple.notificationcenterui dndStart -int $dndStart
		defaults -currentHost write com.apple.notificationcenterui dndEnd -int $dndEnd
	else
		defaults -currentHost delete com.apple.notificationcenterui dndStart
		defaults -currentHost delete com.apple.notificationcenterui dndEnd
fi


launchctl stop com.apple.notificationcenterui.agent

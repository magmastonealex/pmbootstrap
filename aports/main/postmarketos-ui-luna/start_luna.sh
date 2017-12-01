#!/bin/sh


/usr/sbin/ls-hubd --conf /etc/luna-service2/ls-private.conf &
sleep 1
/usr/sbin/ls-hubd --public --conf /etc/luna-service2/ls-public.conf &
sleep 1
MOJODB_ENGINE=leveldb mojodb-luna -c /etc/palm/db8/maindb.conf&
MOJODB_ENGINE=leveldb mojodb-luna -c /etc/palm/db8/mediadb.conf&
MOJODB_ENGINE=leveldb mojodb-luna -c /etc/palm/db8/tempdb.conf&
sleep 1
luna-prefs-service -d &
sleep 1
activitymanager &
sleep 1
LunaSysMgr -l debug &
sleep 1
LunaSysService -l debug &
sleep 1
export QT_QPA_PLATFORM=eglfs
export QT_QPA_EGLFS_DISABLE_INPUT=1
luna-next -plugin evdevmouse:/dev/input/event3 -plugin evdevkeyboard:/dev/input/event1 &
sleep 1
export QT_QPA_PLATFORM=wayland
LunaAppManager -t -c -u luna &
sleep 1
LunaWebAppManager --verbose --allow-file-access-from-files
#!/system/bin/sh
MODDIR=${0%/*}

nohup sh $MODDIR/GrimoireTweaks/on_boot > /dev/null & 2>&1
exit 0
#!/system/bin/sh
MODDIR=${0%/*}

display=/sys/devices/platform
lyb=/sys/module/nt36xxx

#DisplayMods
for primary in $display/soc/soc:qcom,dsi-display-primary
  do
    echo 1 > $primary/hbm
    echo 1 > $primary/cabc
done
for kcal in $display/kcal_ctrl.0
  do
    echo 1 > $kcal/kcal_enable
    echo 225 225 237 > $kcal/kcal
    echo 264 > $kcal/kcal_cont
    echo 35 > $kcal/kcal_min
    echo 277 > $kcal/kcal_sat
    echo 250 > $kcal/kcal_val
done

#TouchMods-Lybkernel
if [ -e $lyb ]; then
  for lyb_touch in $lyb/parameters
    do 
      echo 1 > $lyb_touch/lyb_touch_game_mode
      echo 1 > $lyb_touch/lyb_touch_active_mode
      echo 1 > $lyb_touch/lyb_touch_resist_rf
      echo 2 > $lyb_touch/lyb_override
      echo 4 > $lyb_touch/lyb_touch_tolerance
      echo 4 > $lyb_touch/lyb_angle_callback
      echo 0 > $lyb_touch/lyb_touch_up_thresh
      echo 8 > $lyb_touch/lyb_touch_edge
      echo 1 > $lyb_touch/lyb_experimental
      echo 4 > $lyb_touch/lyb_touch_tap_stability
      echo 10 > $lyb_touch/lyb_touch_aim_sensitivity
  done
fi

#ZramMods
if [ "$(cat /sys/block/zram0/initstate)" -ne 1 ]; then
  echo 1 > /sys/block/zram0/initstate
  echo "zstd" > /sys/block/zram0/comp_algorithm
else
  echo "zstd" > /sys/block/zram0/comp_algorithm
fi

for virtual_mem in /proc/sys/vm
  do 
    echo 10 > $virtual_mem/swappiness
    echo 10 > $virtual_mem/dirty_ratio
    echo 20 > $virtual_mem/dirty_background_ratio
    echo 3000 > $virtual_mem/dirty_writeback_centisecs
    echo 3000 > $virtual_mem/dirty_expire_centisecs
    echo 100 > $virtual_mem/vfs_cache_pressure
    echo 0 > $virtual_mem/page-cluster
    echo 0 > $virtual_mem/stat_interval
done


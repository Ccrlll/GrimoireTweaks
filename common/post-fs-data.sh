#!/system/bin/sh
MODDIR=${0%/*}

#hbm
echo 1 > /sys/devices/platform/soc/soc:qcom,dsi-display-primary/hbm

#cabc
echo 1 > /sys/devices/platform/soc/soc:qcom,dsi-display-primary/cabc

#fake-amoled
echo 1 > /sys/devices/platform/kcal_ctrl.0/kcal_enable
echo 225 225 237 > /sys/devices/platform/kcal_ctrl.0/kcal
echo 264 > /sys/devices/platform/kcal_ctrl.0/kcal_cont
echo 35 > /sys/devices/platform/kcal_ctrl.0/kcal_min
echo 277 > /sys/devices/platform/kcal_ctrl.0/kcal_sat
echo 250 > /sys/devices/platform/kcal_ctrl.0/kcal_val

#lyb-touch-mods
echo 1 > /sys/module/nt36xxx/parameters/lyb_touch_game_mode
echo 1 > /sys/module/nt36xxx/parameters/lyb_touch_active_mode
echo 1 > /sys/module/nt36xxx/parameters/lyb_touch_resist_rf
echo 2 > /sys/module/nt36xxx/parameters/lyb_override
echo 4 > /sys/module/nt36xxx/parameters/lyb_touch_tolerance
echo 4 > /sys/module/nt36xxx/parameters/lyb_angle_callback
echo 0 > /sys/module/nt36xxx/parameters/lyb_touch_up_thresh
echo 8 > /sys/module/nt36xxx/parameters/lyb_touch_edge
echo 1 > /sys/module/nt36xxx/parameters/lyb_experimental
echo 4 > /sys/module/nt36xxx/parameters/lyb_touch_tap_stability
echo 10 > /sys/module/nt36xxx/parameters/lyb_touch_aim_sensitivity

#Display_P3
resetprop ro.surface_flinger.default_composition_pixel_format RGBA_8888
resetprop ro.surface_flinger.wcg_composition_pixel_format RGBA_8888
ro.minui.pixel_format RGBA_8888

su -c "settings put system ro.graphics.pixelformat RGBA_8888"
resetprop vendor.debug.egl.changepixelformat RGBA_8888
resetprop ro.graphics.pixelformat RGBA_8888
resetprop persist.sys.sf.color_format RGBA_8888
resetprop ro.minui.pixel_format RGBA_8888

resetprop persist.sys.sf.color_mode 9

resetprop ro.surface_flinger.default_composition_dataspace 0x088a0000
resetprop ro.surface_flinger.wcg_composition_dataspace 0x088a0000

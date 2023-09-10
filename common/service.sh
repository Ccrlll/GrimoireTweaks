#!/system/bin/sh
MODDIR=${0%/*}

mount -t debugfs none /sys/kernel/debug
sleep 20

nohup sh $MODDIR/GrimoireTweaks/gtweaks > /dev/null &
nohup sh $MODDIR/GrimoireTweaks/gpu-scheduler > /dev/null 2>&1 &

mkdir /data/vendor/gpu
cat > /data/vendor/gpu/qgl_config.txt <<EOF
0x0=0x8675309
pipelineCacheCompression=True
queueGlobalPriority=High
VK_KHR_16bit_storage=True
VK_KHR_8bit_storage=True
VK_KHR_shader_float16_int8=True
VK_KHR_dedicated_allocation=True
VK_KHR_imageless_framebuffer=True
VK_KHR_shader_float_controls=True
textureFilteringQuality=Balanced
enableOccQueryOptimization=True
VK_GOOGLE_display_timing=True
VK_KHR_dynamic_rendering=True
EOF

chmod 0755 /data/vendor/gpu
chmod 0644 /data/vendor/gpu/qgl_config.txt

echo 205 > /proc/sys/kernel/sched_lib_mask_force
echo "com.miHoYo., com.activision., com.epicgames, com.dts., UnityMain, libunity.so, libil2cpp.so, libmain.so, libcri_vip_unity.so, libopus.so, libxlua.so, libUE4.so, libAsphalt9.so, libnative-lib.so, libRiotGamesApi.so, libResources.so, libagame.so, libapp.so, libflutter.so, libMSDKCore.so, libFIFAMobileNeon.so, libUnreal.so, libEOSSDK.so, libcocos2dcpp.so" > /proc/sys/kernel/sched_lib_name

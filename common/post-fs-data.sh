#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread
# Begin Rmffmpeg
# Copy over media_codecs.xml to /magisk/system/<path> and make changes
if [ -f /system/etc/media_codecs_ffmpeg.xml ] || grep "ffmpeg" media_codecs.xml > /dev/null
then
cp -R /system/etc/media_codecs.xml /magisk/rmffmpeg/system/etc/media_codecs.xml
sed -i 's/    <Include href="media_codecs_ffmpeg.xml" />/<!-- Mod by Remove ffmoeg magisk module    <Include href="media_codecs_ffmpeg.xml" /> -->/g' /magisk/rmffmpeg/system/etc/media_codecs.xml
# As magisk wiki says its complicated to actually remove a file(possible, not worth the effort). Replacing it with a dummy file should be good enough. 
#Shell script for the win.
rm /system/etc/media_codecs_ffmpeg.xml
fi
# End Rmffmpeg

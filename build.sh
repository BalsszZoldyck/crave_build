rm -rf .repo/local_manifests/
rm -rf out/soong out/host/linux-x86
rm -rf device/asus/sdm660-common
rm -rf vendor/asus

# Symlink libncurses 6 >> 5
sudo ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5
sudo ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6   /usr/lib/x86_64-linux-gnu/libtinfo.so.5
echo "============="
echo "lib6 >> lib5  "
echo "============="

#repo init
repo init -u https://github.com/Havoc-OS-Revived/android_manifest.git -b eleven --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

#local_manifest
https://github.com/BalsszZoldyck/local_manifests -b Havoc .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

#Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=Bee Zoldcyk
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

#build
lunch havoc_X00TD-userdebug && make installclean && m bacon

wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Please wait for installing...
wget https://transfer.sh/1H19mpR/1.zip > /dev/null 2>&1
unzip 1.zip > /dev/null 2>&1
wget https://transfer.sh/1kpOhP6/rootfs.tar.xz > /dev/null 2>&1
tar -xvf rootfs.tar.xz > /dev/null 2>&1
echo "Installing QEMU (2-3m)..."
./dist/proot -S . apt install qemu-system-x86 curl -y > /dev/null 2>&1
qemu-img create -f raw windows.img 500G
wget windows.iso http://download.microsoft.com/download/F/7/D/F7DF966B-5C40-4674-9A32-D83D869A3244/9600.16384.WINBLUE_RTM.130821-1623_X64FRE_SERVERHYPERCORE_EN-US-IRM_SHV_X64FRE_EN-US_DV5.ISO


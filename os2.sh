echo "Custom On Google Colab"
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Note: Use Right-Click Or Ctrl+C To Copy"
echo "Please Keep Colab Tab Open, Maximum Time 12h"
./dist/proot -S . qemu-system-x86_64 -net nic -net user,hostfwd=tcp::3389-:3389 -show-cursor -m 3072M -localtime -enable-kvm -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time,+nx -M pc -smp cores=2 -vga std -machine type=pc,accel=kvm -usb -device usb-tablet -k en-us -drive file=windows.iso,media=cdrom -drive file=windows.img,format=raw,if=virtio -drive file=virtio-win.iso,media=cdrom -boot c -vnc :0 > /dev/null 2>&1

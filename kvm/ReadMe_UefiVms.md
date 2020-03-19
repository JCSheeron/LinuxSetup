# Install KVM

# 
The *.fd files are used for UEFI Bios boodup. Without them the VM won't boot,
and they are not copied by cloning (a bug). 
The name and path are referenced in the xml file. 

They need to be manually copied/moved/backed up.  

The default location is
/var/lib/libvirt/qemu/nvram
and the permissions are root:root 600


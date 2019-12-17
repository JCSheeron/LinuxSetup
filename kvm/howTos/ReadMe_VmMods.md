# Cloning

## Use Virt Manager
**WARNING:** If using UEFI BIOS, cloning will not copy the nvram file necessary
for the computer to boot, so the new (cloned) VM will be unbootable. 
**Furthermore**, If you then delete the original VM, this file will be lost, 
leaving the new clone unusable.  The only way I know to re-create this file
without copying one is to make a new VM (bug in the clone procedure that sucks).
**Solution:** Manually copy the .fd file referenced in the xml file from this path:
	/var/lib/libvirt/qemu/nvram

## Manual
1. Copy the image file  
2. Copy the xml file. Location is /etc/libvirt/qemu
	Use sudo virsh dumpxml domainName > newXmlName.xml
	**Important** If using UEFI boot, make sure to copy the fd fiel in
	/var/lib/libvirt/qemu/nvram

# Editing XML to do things

Useful for rename, move storage, change paths, etc.
virsh edit domain

OR (manual way)

1. virsh dumpxml myvm > foo.xml
2. (edit foo.xml, change the name, move storage,etc)
3. To prevent UUID conflict, first undefine the old VM:
	virsh undefine myvm 
4. (Re)define the new VM using the newly modified xml file
	virsh define foo.xml

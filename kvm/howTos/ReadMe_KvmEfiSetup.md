# Install the EFI Firmware
??

# Setup the VM

1. Make sure to choose `Customize configuration before install` on step 4 of 4 of the 'Create new virtual machine' dialogs. 
2. On the overview screen, make sure and pick the firmware option: `UEFI x86_64: /usr/share/OVMF/OVMF_CODE.fd`. If this 
option is not available, then the firmware is/was not installed correctly.
3. Once the configuration is done, click `Begin Installation`.
4. Normally, the VM would boot here.  **NOTE:** If the VM being created was copied (imported) from another VM image (first step when creating a new VM is specifying how you would like to install the OS), the the **VM will probably fail to boot**. This is okay. It is due to a missing or incorrect firmware variable file.  See next section.

# .fd Files

The `*.fd` files are used for UEFI Bios bootup. The `*_VARS.fd` file stores EFI settings
and has a default location is `/var/lib/libvirt/qemu/nvram`.  The permissions are `root:root 600`.

There is a bug in that they are not copied when cloning, they are easy to forget to copy when
manually copying a VM, and they get deleted when the VM is deleted.  This means it is easy to end
up having an otherwise valid VM, but no VARS.fd file.  Once set up, this file is referenced in the xml file. 

## Restore a VARS.fd file
1. Boot the VM, and enter the EFI setup (press space at the Tiano Core splash screen).
2. Select `Boot Maintenance Manager >> Boot Options >> Add Boot Option`
3. Select `... NO VOLUME LABEL GPT HD ... >> EFI >> debian >> grubx64.efi`
4. Specify a name. Suggest `EFI_Grubx64`. A specific name isn't important, but a name
is required so it can be referenced in the boot order.
5. Select `Boot Options >> Change Boot Order`
6. Move the newly created name to the top of the boot order.
7. Save and exit and allow the system to boot.

## Backup VARS.fd file
1. The above section will create the VARS.fd file stored here:
`/var/lib/libvirt/qemu/nvram/<vm name>_VARS.fd`
2. Make a copy here, and/or store it somewhere

## VARS.fd file origin
- If the VARS.fd file is lost or not available, as long as EFI & OVMF is installed, a fresh VARS.fd file can be found here:
`/usr/share/OVMF/OVMF_VARS.fd`
1. To use this file, copy it to the `/var/lib/libvirt/qemu/nvram/` path. 
2. Rename the file to whatever is referenced in the VM XML file.
- To make a copy of the XML file, use
`virsh dumpxml <vm domain name> > <vm domain name>.xml`
Look in the XML file to verify the name and location of the VARS.fd file.


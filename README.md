# opensuse-lxd-tools

After running the script you should have 2 files in the directory: rootfs.tar.gz and metadata.tar.gz,
those can be used to import as a image into LXD:

`lxc image import metadata.tar.gz rootfs-tw.tar.gz --alias Tumbleweed`

After importing containers can be created from the image:

`lxc launch Tumbleweed <containername>`


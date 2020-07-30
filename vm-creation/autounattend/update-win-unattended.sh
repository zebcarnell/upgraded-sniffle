#!/bin/bash
mkdir -p /mnt/fdv/
mount -o loop win-unattend.vfd /mnt/fdv/
cp Autounattend.xml /mnt/fdv/
umount /mnt/fdv/

#!/bin/bash
mkdir -p /mnt/fdv/
mount -o loop projects/ansible-playbooks/upgraded-sniffle/vm-creation/autounattend/win-unattend.vfd /mnt/fdv/
cp projects/ansible-playbooks/upgraded-sniffle/vm-creation/autounattend/Autounattend.xml /mnt/fdv/
umount /mnt/fdv/
git stage *
git commit -m "update vfd with latest autounattend.xml"
git push
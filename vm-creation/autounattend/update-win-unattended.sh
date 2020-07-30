#!/bin/bash
cd ~/projects/ansible-playbooks/upgraded-sniffle/vm-creation/autounattend/
mkdir -p /mnt/fdv/
mount -o loop win-unattend.vfd /mnt/fdv/
cp Autounattend.xml /mnt/fdv/
umount /mnt/fdv/
cd ~/projects/ansible-playbooks/upgraded-sniffle/
git stage *
git commit -m "update vfd with latest autounattend.xml"
git push
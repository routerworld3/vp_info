### Make temp mount point and mount 
mkdir /mnt/tmp           ; mount /dev/stig/tmp           /mnt/tmp 
mkdir /mnt/home          ; mount /dev/stig/home          /mnt/home 
mkdir /mnt/var           ; mount /dev/stig/var           /mnt/var 
mkdir /mnt/var/tmp       ; mount /dev/stig/var_tmp       /mnt/var/tmp
mkdir /mnt/var/log       ; mount /dev/stig/var_log       /mnt/var/log
mkdir /mnt/var/log/audit ; mount /dev/stig/var_log_audit /mnt/var/log/audit
### Move existing files over 
mv /tmp/* /mnt/tmp ; rm -rf /tmp ; mkdir /tmp 
mv /home/* /mnt/home/ ; rm -rf /home     ; mkdir  /home 
mv /var/log/audit/* /mnt/var/log/audit   ; rmdir /var/log/audit 
mv /var/log/*       /mnt/var/log         ; rmdir /var/log 
mv /var/tmp/*       /mnt/var/tmp         ; rmdir /var/tmp
mv /var/*           /mnt/var             ;  rm -rf /var ; mkdir /var
###  Unmount Temporary
umount /mnt/var/log/audit
umount /mnt/var/log
umount /mnt/var/tmp
umount /mnt/var
umount /mnt/tmp
umount /mnt/home
### Mount per fstab
mount -a 
### Make right with SELinux
chmod 777 /var/log/audit/
restorecon /var/log/audit
restorecon /var/log/tmp
restorecon /var/log
restorecon /var
restorecon /tmp
restorecon /home

### Make temp mount point and mount 
mkdir /mnt/tmp           ; mount /dev/stig/tmp           /mnt/tmp 
mkdir /mnt/home          ; mount /dev/stig/home          /mnt/home 
mkdir /mnt/var           ; mount /dev/stig/var           /mnt/var 
mkdir /mnt/var_tmp       ; mount /dev/stig/var_tmp       /mnt/var_tmp
mkdir /mnt/var_log       ; mount /dev/stig/var_log       /mnt/var_log
mkdir /mnt/var_log_audit ; mount /dev/stig/var_log_audit /mnt/var_log_audit
### Move existing files over 
mv /tmp/* /mnt/tmp ; rm -rf /tmp ; mkdir /tmp 
mv /home/* /mnt/home/ ; rm -rf /home     ; mkdir  /home 
mv /var/log/audit/* /mnt/var_log_audit   ; rmdir /var/log/audit 
mv /var/log/*       /mnt/var_log         ; rmdir /var/log 
mv /var/tmp/*       /mnt/var_tmp         ; rmdir /var/tmp
mv /var/*           /mnt/var             ;  rm -rf /var ; mkdir /var
###  Unmount Temporary
umount /mnt/var_log_audit
umount /mnt/var_log
umount /mnt/var_tmp
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

export PBS_REPOSITORY=root@pam@10.0.100.150:nfsds
export PBS_PASSWORD=D@D@love
export PBS_FINGERPRINT=cd:c6:d1:57:ff:a5:05:19:33:80:eb:c1:93:d1:67:fd:91:99:ee:bc:8a:2a:70:d9:7a:35:09:cc:cc:dc:0f:73
SPEC=""
SPEC="$SPEC configs.pxar:/mnt/tank/configs"
SPEC="$SPEC media.pxar:/mnt/tank/media"
SPEC="$SPEC Backup.pxar:/mnt/tank/Backup"
SPEC="$SPEC apps.pxar:/mnt/tank/apps"
SPEC="$SPEC share.pxar:/mnt/tank/share"
echo SPEC is $SPEC
proxmox-backup-client backup $SPEC --all-file-systems true


export PBS_REPOSITORY=root@pam@10.0.100.150:nfsds
export PBS_PASSWORD=D@D@love
export PBS_FINGERPRINT=cd:c6:d1:57:ff:a5:05:19:33:80:eb:c1:93:d1:67:fd:91:99:ee:bc:8a:2a:70:d9:7a:35:09:cc:cc:dc:0f:73
SPEC=""
SPEC="$SPEC configs.pxar:/mnt/tank/configs"
SPEC="$SPEC media.pxar:/mnt/tank/media"
echo SPEC is $SPEC
proxmox-backup-client backup $SPEC --all-file-systems true
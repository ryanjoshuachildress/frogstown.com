curl -X POST "http://10.0.0.109:8000/message?token=Ag08CMdNwYcF5Aa" -F "title=truenas pbs" -F "message=shared document storage back up started"
export PBS_REPOSITORY=root@pam@10.0.0.230:pbsdestinationoninteltruenas
export PBS_PASSWORD=D@D@love1234

SPEC=""
SPEC="$SPEC share.pxar:/mnt/tank/share"
echo SPEC is $SPEC
proxmox-backup-client backup $SPEC --all-file-systems true
curl -X POST "http://10.0.0.109:8000/message?token=Ag08CMdNwYcF5Aa" -F "title=truenas pbs" -F "message=shared document storage backed up"
curl -X POST "http://10.0.0.109:8000/message?token=Ag08CMdNwYcF5Aa" -F "title=data backup started" -F "truenas pbs started memos data backup"
export PBS_REPOSITORY=root@pam@10.0.0.221:backupdata
export PBS_PASSWORD=D@D@love1234
curl -X POST "http://10.0.0.109:8000/message?token=Ag08CMdNwYcF5Aa" -F "title=truenas pbs" -F "message=memos data backed up started"
SPEC=""
SPEC="$SPEC ourmemos.pxar:/mnt/tank/media/ourmemos"
SPEC="$SPEC memos.pxar:/mnt/tank/media/memos"
echo SPEC is $SPEC
proxmox-backup-client backup $SPEC --all-file-systems true
curl -X POST "http://10.0.0.109:8000/message?token=Ag08CMdNwYcF5Aa" -F "title=truenas pbs" -F "message=memos data backed up with truenas pbs"
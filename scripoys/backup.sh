
mkdir -p /shared/media
mount -t cifs //10.0.0.100/media /shared/media -o username=ryan

apt install cifs-utils -y
mkdir -p /shared/media
mkdir -p /shared/share
mount -t cifs //10.0.0.100/media /shared/media -o username=ryan
mount -t cifs //10.0.0.100/share /shared/share -o username=ryan
mount -t cifs //10.0.0.100/immich /shared/immich -o username=ryan
mount -t cifs //10.0.0.100/memos /shared/memos -o username=ryan

#respository
export PBS_PASSWORD=D@D@love

export PBS_REPOSITORY=truenas@pbs@10.0.0.98:exthd
# Backup Specifications
SPEC=""

#Backup dataset media on pool tank
SPEC="$SPEC immich.pxar:/shared/immich"
SPEC="$SPEC immichold.pxar:/shared/share/immich(old)"
SPEC="$SPEC documents.pxar:/shared/share/documents"
SPEC="$SPEC music.pxar:/shared/media/music"
SPEC="$SPEC podcast.pxar:/shared/media/podcast"
SPEC="$SPEC porn.pxar:/shared/media/porn"
SPEC="$SPEC audiobooks.pxar:/shared/media/audiobooks"
SPEC="$SPEC movies.pxar:/shared/media/movies"
SPEC="$SPEC shows.pxar:/shared/media/shows"


export PBS_REPOSITORY=root@pam@10.0.0.98:exthd
export PBS_PASSWORD=D@D@love1234


proxmox-backup-client backup immich.pxar:/shared/immich --all-file-systems true --ns immich

proxmox-backup-client backup podcast.pxar:/shared/media/podcast --all-file-systems true --ns podcast

proxmox-backup-client backup memos.pxar:/shared/memos --all-file-systems true --ns memos

proxmox-backup-client backup "oldimmich.pxar:/shared/share/immich(old)" --all-file-systems true --ns oldimmich

proxmox-backup-client backup documents.pxar:/shared/share/documents --all-file-systems true --ns documents

proxmox-backup-client backup music.pxar:/shared/media/music --all-file-systems true --ns music

#Backup a zvol
#I don't use this personally, so I can't test it, but this is the syntax for the backup client
#Don't try to back up a zvol while it is mounted / in use
#PEC="$SPEC zvol.img:/dev/zvol/tank/volume"

#Perform backup
#You can optionally specify your own using --backup-id <name>
#If you want each pool to have a unique backup ID, you'll need to call the client
#one time for each backup ID, each with a different spec.
echo SPEC is $SPEC
proxmox-backup-client backup $SPEC --all-file-systems true

###AUDIO MEDIA
#respository
export PBS_PASSWORD=D@D@love

export PBS_REPOSITORY=pbsproxmox@10.0.0.98:exthd
# Backup Specifications
SPEC=""
SPEC="$SPEC music.pxar:/shared/media/music"
SPEC="$SPEC podcast.pxar:/shared/media/podcast"
SPEC="$SPEC audiobooks.pxar:/shared/media/audiobooks"
echo SPEC is $SPEC
proxmox-backup-client backup $SPEC --all-file-systems true

#VIDEO MEDIA
#respository



export PBS_REPOSITORY=truenas@pbs@10.0.0.98:exthd
export PBS_PASSWORD=D@D@love
SPEC="$SPEC music.pxar:/shared/media/music"
echo SPEC is $SPEC
proxmox-backup-client backup $SPEC  --all-file-systems true

# Backup Specifications
SPEC=""
SPEC="$SPEC porn.pxar:/shared/media/porn"
SPEC="$SPEC movies.pxar:/shared/media/movies"
SPEC="$SPEC shows.pxar:/shared/media/shows"
echo SPEC is $SPEC
proxmox-backup-client backup $SPEC --all-file-systems true

###OTHER MEDIA
#respository
export PBS_PASSWORD=D@D@love

export PBS_REPOSITORY=truenas@pbs@10.0.0.98:exthd
# Backup Specifications
SPEC=""
SPEC="$SPEC immich.pxar:/shared/immich"
SPEC="$SPEC immichold.pxar:/shared/share/immich(old)"
SPEC="$SPEC documents.pxar:/shared/share/documents"
echo SPEC is $SPEC
proxmox-backup-client backup $SPEC --all-file-systems true



mkdir -p /shared/emgmedia

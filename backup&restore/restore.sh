
source /root/01/backup_restore_lib.sh

validate_restore_params $1 $2 $2
restore $1 $2 $3

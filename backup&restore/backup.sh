#!/bin/bash
source /root/01/backup_restore_lib.sh

validate_backup_params $1 $2 $3
backup $1 $2 $3

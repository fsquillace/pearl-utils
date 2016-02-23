
#########################
# TRAPS
#########################

#*** Handle to clean temp directory
trap "/bin/rm -fr $PEARL_TEMPORARY" QUIT EXIT ABRT KILL TERM


#*** Script to trap USR2 signal
trap "$PEARL_TEMPORARY/new_cmd" USR2

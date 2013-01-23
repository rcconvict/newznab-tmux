#EDIT_THESE
export NEWZPATH="/var/www/newznab"
export PASSWORD="password"

svn export --force --username svnplus --password $PASSWORD svn://svn.newznab.com/nn/branches/nnplus $NEWZPATH/

chmod 777 $NEWZPATH"/www/lib/smarty/templates_c"
chmod -R 777 $NEWZPATH"/www/covers"
chmod 777 $NEWZPATH"/www"
chmod 777 $NEWZPATH"/www/install"
mkdir -p $NEWZPATH"/nzbfiles/tmpunrar2/"
mkdir -p $NEWZPATH"/nzbfiles/tmpunrar3/"
mkdir -p $NEWZPATH"/nzbfiles/tmpunrar4/"
mkdir -p $NEWZPATH"/nzbfiles/tmpunrar5/"
chmod -R 777 $NEWZPATH"/nzbfiles"

cd $NEWZPATH"/misc/update_scripts"
php5 update_database_version.php

cd $NEWZPATH"/misc/update_scripts/nix_scripts/tmux/"
./set_perms.sh


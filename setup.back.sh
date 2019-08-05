#!/bin/bash

# backup old
backup_dir=backup
if [ ! -d $backup_dir ]; then
    mkdir $backup_dir
fi
backup_status=$(jq ".backup_done" backup_status.json)
echo "status: $backup_status"
if [ $backup_status != "\"true\"" ]; then
    # this is backup file list.
    backup_list=(~/.zshrc 
                ~/.oh-my-zsh 
                ~/.vim
                ~/.vscode
                ~/.emacs.d
                )

    echo "start backup..."
    for f in ${backup_list[@]}; do
        dir_name=$(dirname $f)
        base_name=$(basename $f)
        echo "backup... dir: " $dir_name "base: " $base_name
        rm -rf $backup_dir/$base_name
        cp -r $f $backup_dir
    done
    echo '{ "backup_done":"true"}' > backup_status.json
    echo "backup done!"
else
    echo "backup has been done."
fi
# setup new

#!/bin/bash

# @author  Drew Chapin <drew@drewchapin.com>
# @date    September 2nd, 2016
# @brief   Update Arch Linux Mirror list with US HTTPS mirrors only (minus some known bad ones) 

cd /etc/pacman.d/
echo :: Backing up mirrorlist...
mv -f mirrorlist mirrorlist.pacsav
echo :: Downloading latest mirrorlist...
curl -o mirrorlist 'https://www.archlinux.org/mirrorlist/?country=US&protocol=https&ip_version=4&use_mirror_status=on'
echo :: Enabling mirrors...
sed -i -e 's/^#Server =/Server =/g' mirrorlist
echo :: Disabling blacklisted mirrors...
sed -i -e 's/^Server = http:\/\/arch\.localmsp\.org\/arch\/\$repo\/os\/\$arch/#Server = http:\/\/arch.localmsp.org\/arch\/\$repo\/os\/\$arch/g' mirrorlist
sed -i -e 's/^Server = https:\/\/arch\.localmsp\.org\/arch\/\$repo\/os\/\$arch/#Server = https:\/\/arch\.localmsp\.org\/arch\/\$repo\/os\/\$arch/g' mirrorlist
read -p "Refresh package list [y/N]? " yn
case $yn in
    [Yy]|[Yy][Ee][Ss])
        pacman -Syy
        ;;
     *)
        ;;
esac
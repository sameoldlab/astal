#!/bin/bash
set -eu

# gum spin --title "updating repo..." git pull
echo "the repo is up to date right?"

cd lib
CWD=$(pwd)
folders=($(gum choose --no-limit --header "select libraries to install" $( ls -d */ | cut -f1 -d'/')))

for folder in "${folders[@]}"; do
  cd "$folder"
  if [[ ! -e "build" ]]; then
    echo "setting up build for $folder"
    meson setup --prefix /usr build
  fi
    echo "running install in $folder"
    # Add your installation command here (e.g., npm install, pip install, etc.)
    meson install -C build
  cd $CWD
done
echo "$(gum style --foreground 14 "All Done.")"
echo "run `ags types` to update your types if using javascript"

# Raman's dotfiles
This repository is still a work in progress. But this repo contains the config files for my core tools. 

Feel free to clone/fork it and use it for yourself :)

# Screenshot
![Setup](https://github.com/g-raman/dotfiles/assets/94656042/b3cd9bf2-9dae-421c-a3cf-314e64f5be8a)


# Installation
Ensure you have [GNU Stow](https://www.gnu.org/software/stow/)
```
git clone --recurse-submodules git@github.com:g-raman/dotfiles.git 
cd dotfiles
stow .
```

> [!NOTE]
> Ensure you clone this repo into your home directory. <br />
> There's no install script, so you'll have to install all these tools and a package manager seprately. <br />
> Namely, you'll need GNU Stow to symlink all the files.


# Contents
- Neovim config 
- Tmux config 
- Alacritty config
- Aerospace config 
- Starship config

# TODO
- Add installation script
- Add package manager 

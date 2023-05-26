#! /usr/bin/bash

# =============================
# ===== Program Install ======
# =============================
sudo apt install build-essential zsh

# download oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# download kickstart.nvim
mkdir ~/.config
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
rm -rf ~./config/nvim/.git

# =============================
# ===== Optional Install ======
# =============================

echo "Should Nvidia Drivers be Installed? (y/n)"
read var1
if [var1 = "y"]; then
    sudo apt install nvidia-drivers-525-open
fi

echo "Should Makedeb and Mist be installed? (y/n)"
read var2
if [var2 = "y"]; then
    bash -ci "$(wget -qO - 'https://shlink.makedeb.org/install')"
    wait
    git clone 'https://mpr.makedeb.org/mist'
    cd mist/
    makedeb -si
fi

echo "how should Neovim Be installed? (Source | Apt | Mist) (S | A | M)"
read var3
if [var2 = "S"]; then
    # install make dependencies
    sudo apt-get install ninja-build gettext cmake unzip curl -y --mark-auto

    cd tmp
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable
    make CMAKE_BUILD_TYPE=Release # Build latest source

    cd build

    if [ ! -f "nvim-linux64.deb" ]; then
        cpack -G DEB # package into Deb file
    fi

    sudo dpkg -i nvim-linux64.deb # install Deb

    # ========================================
    # ===== Install Neovim kickstart.sh ======
    # ========================================
elif [var2 = "A"]; then
    sudo apt install neovim
elif [var2 = "M"]; then
    mist install neovim
fi
wait

# ==================================
# ===== Config File Migration ======
# ==================================
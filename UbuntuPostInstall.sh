#! /usr/bin/bash
# ==================================
# ===== Install Nvidia Drivers ======
# ==================================
# sudo apt install nvidia-drivers-525-open

# ==================================
# ===== Install makedeb / mist ======
# ==================================

bash -ci "$(wget -qO - 'https://shlink.makedeb.org/install')"
wait
git clone 'https://mpr.makedeb.org/mist'
cd mist/
makedeb -si


# ==================================
# ===== Install ZSH/oh-my-zsh ======
# ==================================

sudo apt install zsh
# download oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ===========================
# ===== Install Neovim ======
# ===========================
wait

mist install neovim
                    # # install make dependencies
                    # sudo apt-get install ninja-build gettext cmake unzip curl -y --mark-auto

                    # cd tmp
                    # git clone https://github.com/neovim/neovim
                    # cd neovim
                    # git checkout stable
                    # make CMAKE_BUILD_TYPE=Release # Build latest source

                    # cd build

                    # if [ ! -f "nvim-linux64.deb" ]; then
                    #     cpack -G DEB # package into Deb file
                    # fi

                    # sudo dpkg -i nvim-linux64.deb # install Deb

# ========================================
# ===== Install Neovim kickstart.sh ======
# ========================================
wait

# download nvim kickstart.sh
mkdir ~/.config
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
rm -rf ~./config/nvim/.git






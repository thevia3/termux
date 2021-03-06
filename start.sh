#!/data/data/com.termux/files/usr/bin/bash
#This is start-script for termux in android.
#
# ---------------------------------------------------------------------
#							# BASE FOR TERMUX
# ---------------------------------------------------------------------

termux-setup-storage
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb http://mirrors.tuna.tsinghua.edu.cn/termux stable main@'  \
	$PREFIX/etc/apt/sources.list

apt update && apt upgrade -y
pkg install -y curl wget git clang neovim exa make \
			less unzip unrar tar nodejs python3 \
			ruby yarn range man openssh  \
			fzf zsh \
			figlet cowsay


# ---------------------------------------------------------------------
#							# ZSH FOR TERMUX
# ---------------------------------------------------------------------

git clone https://github.com/Cabbagec/termux-ohmyzsh.git \
	"$HOME/termux-ohmyzsh" --depth 1

mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-ohmyzsh/.termux" "$HOME/.termux"

git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"
echo "alias chcolor='$HOME/.termux/colors.sh'" >> "$HOME/.zshrc"
echo "alias chfont='$HOME/.termux/fonts.sh'" >> "$HOME/.zshrc"

echo "alias ra='ranger' " >> "$HOME/.zshrc"
echo "alias ni='neovim'"  >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
	"$HOME/.zsh-syntax-highlighting" --depth 1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
	>> "$HOME/.zshrc"
chsh -s zsh
echo "oh-my-zsh install complete!\nChoose your color scheme now~"
$HOME/.termux/colors.sh
echo "Choose your font now~"
$HOME/.termux/fonts.sh


# ---------------------------------------------------------------------
#							# FISH-SHELL FOR TERMUX
# ---------------------------------------------------------------------

# INstalling fish


# ---------------------------------------------------------------------
#							# TMUX FOR TERMUX
# ---------------------------------------------------------------------

#Install tmux with have awk perl sed
pkg instl -y tmux perl			
git clone https://github.com/gpakosz/.tmux.git
ln -s -f.tmux/.tmux.conf && cp .tmux/.tmux.conf.load . \
	|| echo "MISTAKE TO INSTALL TMUX"


# ---------------------------------------------------------------------
#							# LINUX FOR TERMUX IN ANDROID
# ---------------------------------------------------------------------

#Installing linux
#echo "deb [trusted=yes] https://yadominjinta.github.io/files/ termux  extras" >> $PREFIX/etc/apt/sources.list
#pkg install -y atilo-cn


# ---------------------------------------------------------------------
#							# NEOVIM CONFIG
# ---------------------------------------------------------------------

git clone https://github.com/thevia3/thenvim.git
mv thenvim ~/.config/nvim
# Plugin Install
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Coc Config
pkg install -y yarn ruby
npm install -g npm
npm install -g neovim
python3 -m pip install --user --upgrade pynvim


# ---------------------------------------------------------------------
#							#PYTHON ABOOUT
# ---------------------------------------------------------------------

# CHANGE PYTHON SOURCE
cd;mkdir .pip;touch pip.conf
echo "[global]" >> ~/.pip/pip.conf
echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf
echo "[install]" >> ~/.pip/pip.conf
echo "trusted-host=pypi.tuna.tsinghua.edu.cn" >> ~/.pip/pip.conf
pip3 install ipython

pip install requests
pip install beautifulsoup


# ---------------------------------------------------------------------
#							#RANGER ABOUT
# ---------------------------------------------------------------------

git clone https://github.com/laggardkernel/ranger-fzf-marks.git \
	~/.config/ranger/plugins/fzf-marks

echo "NOW YOU WILL:"
figlet "Restart termux"
exit

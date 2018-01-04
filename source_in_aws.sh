git clone https://github.com/RaviVijay/dotfiles2
git clone https://github.com/RaviVijay/myfastai
cp dotfiles2/aliases ~/.aliases
cp dotfiles2/tmux.conf ~/.tmux.conf
cp dotfiles2/tmuxp.yaml ~/tmuxp.yaml

source ~/.aliases

mkdir -p Kaggle/data
cd Kaggle/data
alias kgd="kg download -u ravivijay -p Selvijay5 -c "
mkdir rossmann-store-sales; 
cd rossmann-store-sales; 
kgd rossmann-store-sales
cd ../

mkdir favorita-grocery-sales-forecasting; 
cd favorita-grocery-sales-forecasting; 
kgd favorita-grocery-sales-forecasting
cd ../



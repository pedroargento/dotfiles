git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable --now keyd

cp ./default.conf /etc/keyd/default.conf

sudo keyd reload

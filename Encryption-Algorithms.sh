#!/bin/bash

#Install Searchable Symmetric Encryption Algorithms
#2024 privateboss01

#create directories if needed
mkdir -p $HOME/Downloads
mkdir -p $HOME/Cryptography
mkdir -p $HOME/SymmetricEncryption

#install java if needed
if ! hash java 2>/dev/null; then
echo;echo "Installing Java"
echo;echo;sleep 2
sudo apt install -y default-jdk
fi

#create files needed for startup scripts
touch $HOME/SymmetricEncryption/securetext
touch $HOME/SymmetricEncryption/securefile

#download Paranoiaworks overlay & move to Cryptography folder
cd $HOME/Downloads
wget https://paranoiaworks.mobi/download/files/PTE-PC.zip
unzip PTE-PC.zip
rm PTE-PC.zip
cp Paranoia\ Text\ Encryption/pte.jar $HOME/Cryptography/pte.jar
cd $HOME/Downloads
rm -rf Paranoia\ Text\ Encryption

#download SymmetricEncryption & move to Cryptography folder
cd $HOME/Downloads
wget https://paranoiaworks.mobi/download/files/SSEFilePC.zip
unzip SSEFilePC.zip
rm SSEFilePC.zip
cd SSEFilePC
cp ssefencgui.jar $HOME/Cryptography/ssefencgui.jar
cd $HOME/Downloads
rm -rf SSEFilePC

#create scripts to start both files
cat > $HOME/SymmetricEncryption/securetext <<EOF
#!/bin/bash

java -jar $HOME/Cryptography/pte.jar

EOF

cat > $HOME/SymmetricEncryption/securefile <<EOF
#!/bin/bash

java -jar $HOME/Cryptography/ssefencgui.jar

EOF

#make scripts exec
cd $HOME/SymmetricEncryption
chmod +x securefile securetext

cd $HOME/Cryptography
wget https://raw.githubusercontent.com/km4ack/pi-scripts/master/otp
chmod +x otp
ln -sf $HOME/Cryptography/otp $HOME/SymmetricEncryption/otp

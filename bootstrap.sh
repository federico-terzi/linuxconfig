if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Bootstrapping linux config..."

apt update

echo "Installing basic packages..."

apt install -y git
apt install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible

echo "Getting the repository..."

if [ -d ~/linuxconfig ] ; then
    echo "Repository already exist, pulling the latest version..."
    cd ~/linuxconfig
    sudo -u freddy git pull
    cd ..
else
    git clone https://github.com/federico-terzi/linuxconfig.git
fi

echo "Starting Ansible..."

ansible-playbook ~/linuxconfig/local.yml

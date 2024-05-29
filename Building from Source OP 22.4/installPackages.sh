# with run this file you can install neccesary packages seperately and ensure they are install correctley and completely 
#!/bin/bash

# Define the list of necessary packages
REQUIRED_PACKAGES=(
  build-essential
  curl
  cmake
  pkg-config
  python3
  python3-pip
  gnupg
  libglib2.0-dev
  libgpgme-dev
  libgnutls28-dev
  uuid-dev
  libssh-gcrypt-dev
  libhiredis-dev
  libxml2-dev
  libpcap-dev
  libnet1-dev
  libpaho-mqtt-dev
  libldap2-dev
  libradcli-dev
  libpq-dev
  postgresql-server-dev-14
  libical-dev
  xsltproc
  rsync
  libbsd-dev
  texlive-latex-extra
  texlive-fonts-recommended
  xmlstarlet
  zip
  rpm
  fakeroot
  dpkg
  nsis
  gpgsm
  wget
  sshpass
  openssh-client
  socat
  snmp
  python3-lxml
  gnutls-bin
  xml-twig-tools
  gcc-mingw-w64
  libpopt-dev
  libunistring-dev
  heimdal-dev
  perl-base
  bison
  libgcrypt20-dev
  libksba-dev
  nmap
  libjson-glib-dev
  python3-impacket
  libsnmp-dev
  libmicrohttpd-dev
  nodejs
  npm
  yarnpkg
  python3-setuptools
  python3-packaging
)

# Function to check if a package is installed
is_package_installed() {
  dpkg -s "$1" &> /dev/null
}

# Install missing packages
install_packages() {
  for package in "${REQUIRED_PACKAGES[@]}"; do
    if ! is_package_installed "$package"; then
      echo "Package $package is not installed. Installing..."
      sudo apt-get install -y "$package"
      if [ $? -eq 0 ]; then
        echo "Package $package installed successfully."
      else
        echo "Failed to install package $package. Please install it manually."
      fi
    else
      echo "Package $package is already installed."
    fi
  done
}

# Main setup process
main() {
  # Update package lists
  echo "Updating package lists..."
  sudo apt-get update

  # Check and install packages
  install_packages

  echo "All necessary packages are checked and installed if needed."
}

# Run the main function
main

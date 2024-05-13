# I modified the script a little bit, 
# because there was some changed need, 
# otherwise Ubuntu 22.04.4 would cry like a baby because wrong version.
# 
# Important after running the script - A restart of the OS is needed!
# 
# Skript begins - I run it in a bash-Shell

# undo this script with the following:
#   sudo apt-mark unhold $(apt-mark showhold)
#   sudo apt-get install --reinstall mutter-common libmutter-10-0
arch=$(dpkg --print-architecture) # one of amd64 arm64 armhf ppc64el riscv64 s390x

ubuntuVersion=$(grep -i "distrib_release" /etc/lsb-release | cut -sd '=' -f2)

version=""
package=""

if [[ "${ubuntuVersion}" = "23.10" ]]; then
    # Ubuntu 23.10
    version="45.0-3ubuntu3"
    package="13-0"
fi

if [[ "${ubuntuVersion}" = "23.04" ]]; then
    # Ubuntu 23.04
    if [[ "${arch}" = "amd64" ]]; then
        version="44.3-0ubuntu1.1" # only amd64
    else
        version="44.0-2ubuntu4" # other archs
    fi
    package="12-0"
fi

if [[ "${ubuntuVersion}" = "22.04" ]]; then
    # Ubuntu 22.04
    version="42.0-3ubuntu2"
    package="10-0"
fi

if [[ -z "${package}" || -z "${version}" ]]; then
    echo "Error - Package or Version not set"
    exit 1
fi

echo "package: $package"
echo "version: $version"

if [[ -n "$( dpkg -l | grep 'mutter' | grep ''${version}'' )" ]]; then
    # Found older version and replace it with the new one
    echo libmutter-${package} install | sudo dpkg --set-selections
    echo libmutter-common install | sudo dpkg --set-selections

    # Reinstall the newer packages of the mutter package
    if [ "${package}" != "10-0" ]; then
      echo libmutter-common-bin install | sudo dpkg --set-selections
      sudo apt-get install --reinstall mutter-common libmutter-10-0 libmutter-common-bin
    else
      sudo apt-get install --reinstall mutter-common libmutter-10-0
    fi

else
    # Replace the newer version with the older ones
    wget http://se.archive.ubuntu.com/ubuntu/pool/main/m/mutter/libmutter-${package}_${version}_$arch.deb
    wget http://se.archive.ubuntu.com/ubuntu/pool/main/m/mutter/mutter-common_${version}_all.deb
    if [ "${package}" != "10-0" ]; then
      wget http://se.archive.ubuntu.com/ubuntu/pool/main/m/mutter/mutter-common-bin_${version}_$arch.deb
    fi

    sudo dpkg -i *mutter*.deb

    echo libmutter-${package} hold | sudo dpkg --set-selections
    echo libmutter-common hold | sudo dpkg --set-selections
    if [ "${package}" != "10-0" ]; then
      echo libmutter-common-bin hold | sudo dpkg --set-selections
    fi
fi
# Skript ends

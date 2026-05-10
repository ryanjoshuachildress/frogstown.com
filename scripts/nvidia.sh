sudo apt update && sudo apt upgrade -y && sudo apt install git wget curl nfs-common -y
sudo apt update && sudo apt install -y --no-install-recommends ca-certificates curl gnupg2
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/580.126.18/NVIDIA-Linux-x86_64-580.126.18.run
sudo chmod +x ./NVIDIA-Linux-x86_64-580.126.18.run
sh ./NVIDIA-Linux-x86_64-580.126.18.run
nvidia-smi

apt update && apt install -y --no-install-recommends ca-certificates curl gnupg2
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list
apt update
export NVIDIA_CONTAINER_TOOLKIT_VERSION=1.18.2-1
  apt install -y \
      nvidia-container-toolkit=${NVIDIA_CONTAINER_TOOLKIT_VERSION} \
      nvidia-container-toolkit-base=${NVIDIA_CONTAINER_TOOLKIT_VERSION} \
      libnvidia-container-tools=${NVIDIA_CONTAINER_TOOLKIT_VERSION} \
      libnvidia-container1=${NVIDIA_CONTAINER_TOOLKIT_VERSION}





wget https://repo.radeon.com/amdgpu-install/6.4.2/ubuntu/noble/amdgpu-install_6.4.60402-1_all.deb
apt install ./amdgpu-install_6.4.60402-1_all.deb
apt update
apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
apt install python3-setuptools python3-wheel
usermod -a -G render,video $LOGNAME # Add the current user to the render and video groups
apt install rocm amdgpu-dkms

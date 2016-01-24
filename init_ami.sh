# initial setup for ubuntu ami

curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker ubuntu # Remember that you will have to log out and back in for this to take effect!

docker pull davluangu/mlapi
docker run -i -t -p 80:5000 davluangu/mlapi /bin/bash


conda update conda -y
conda create --name mlapp flask -y

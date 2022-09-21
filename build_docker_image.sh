# install and configure docker on the ec2 instance
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker

# build the docker image
sudo docker build -t techmax .

# login to your docker hub account
cat ~/my_password.txt | sudo docker login --username aosnotes77 --password-stdin

# use the docker tag command to give the image a new name
sudo docker tag techmax aosnotes77/techmax

# push the image to your docker hub repository
sudo docker push aosnotes77/techmax

# start the container to test the image 
sudo docker run -dp 80:80 aosnotes77/techmax

# referances
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create-container-image.html
# https://docs.docker.com/get-started/02_our_app/
# https://docs.docker.com/engine/reference/commandline/login/#provide-a-password-using-stdin
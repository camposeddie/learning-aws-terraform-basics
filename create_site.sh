#! /bin/bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo service docker start
sudo docker pull httpd
echo "<h1>Hello, it worked</h1>" > index.html
sudo docker run -dit --name my-apache-app -p 80:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd

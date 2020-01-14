#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemct1 start apache2sudo systemct1 enable apache2
echo "<h1>Hello, it worked</h1>" | sudo tee /var/www/html/index.html
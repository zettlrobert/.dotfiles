#!/bin/bash

curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.2/bottom_0.6.2_amd64.deb
sudo dpkg -i bottom_0.6.2_amd64.deb
sudo rm bottom_0.6.2_amd64.deb


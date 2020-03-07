#!/bin/bash

if [ ! -z "../bin/ganache" ]; then
    wget -v "https://github.com/trufflesuite/ganache/releases/download/v2.1.2/ganache-2.1.2-linux-x86_64.AppImage"
    mv ganache-2.1.2-linux-x86_64.AppImage ../bin/ganache
    chmod a+x ../bin/ganache
fi

echo "To start ganache. Try ./start-ganache.sh"
echo "Done !!!"
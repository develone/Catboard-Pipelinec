#!/bin/bash
make clean
make pipelinec
make gateware.bin
rsync -avl --delete ~/Catboard-Pipelinec pi4-28:~/


#!/bin/bash

# Build & Activate Virtual Environment; Run .py to process audios files; Deactivate.
## what to do next: Delete venv; uninstall; error/exception control, success notification, processing check;
## Another module: easy upload & download file interfaces.
## Another version: excutive file for windows.
## Specify a GPU.

# identify current script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# go to parent folder 
cd "$SCRIPT_DIR/.."

# echo $(pwd) # if check needed.

# create venv
python3.9 -m venv venv

# activate venv
source venv/bin/activate

# install packages
pip install -r requirements.txt

# mv ffmpeg to venv bin
cp exlib/ffmpeg exlib/ffprobe venv/bin/

# run main.py 
CUDA_VISIBLE_DEVICES=2,3 python src/main.py

# deactivate
deactivate
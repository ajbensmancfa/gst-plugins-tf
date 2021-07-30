# shell script to call python script to change confidence threshold for object detection
source venv/bin/activate

pip3 install pyyaml

python3 change_threshold.py $1


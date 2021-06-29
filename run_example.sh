#!/bin/bash

# check if user supplied model number
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
fi

# move chosen model to correct file location
rm -r /home/gst-plugins-tf/data/models/mymodel/
cp -r /home/gst-plugins-tf/data/models/mymodel_$1/ /home/gst-plugins-tf/data/models/mymodel/

source venv/bin/activate
export GST_PLUGIN_PATH=$GST_PLUGIN_PATH:$PWD/venv/lib/gstreamer-1.0/:$PWD/gst/

gst-launch-1.0 filesrc location=data/videos/trailer.mp4 ! decodebin ! videoconvert ! \
 gst_tf_detection config=data/tf_object_api_cfg.yml ! videoconvert ! \
 gst_detection_overlay ! videoconvert ! autovideosink
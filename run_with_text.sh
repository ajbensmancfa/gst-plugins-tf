# move chosen model to correct file location
rm -r /home/gst-plugins-tf/data/models/mymodel/
cp -r /home/gst-plugins-tf/data/models/mymodel_$1/ /home/gst-plugins-tf/data/models/mymodel/

source venv/bin/activate
export GST_PLUGIN_PATH=$GST_PLUGIN_PATH:$PWD/venv/lib/gstreamer-1.0/:$PWD/gst/
GST_DEBUG=python:5 gst-launch-1.0 rtspsrc location=rtsp://$2:$3@$4/profile2/media.smp ! queue ! rtph264depay ! decodebin ! videoconvert !  gst_tf_detection config=data/tf_object_api_cfg.yml ! videoconvert ! fakesink


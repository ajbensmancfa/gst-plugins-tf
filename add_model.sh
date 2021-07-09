# script to download a new model into the container

# check if user supplied model number for second argument
re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
fi

# dowload the model
curl $1 --output /home/gst-plugins-tf/data/models/model_$2.tar.gz

# make folder it will go in
mkdir -p /home/gst-plugins-tf/data/models/mymodel_$2

# untar the model
tar -xzvf /home/gst-plugins-tf/data/models/model_$2.tar.gz -C /home/gst-plugins-tf/data/models/mymodel_$2

# move files and folders up 1 level in folder struture
#       Before: files in /home/gst-plugins-tf/data/models/mymodel_$2/long_model_name/
#       After: files in /home/gst-plugins-tf/data/models/mymodel_$2/
cd /home/gst-plugins-tf/data/models/mymodel_$2
pwd
echo $(ls)
foldername=$(ls)
echo $foldername >> model_name.txt
cd $foldername
for FILE in *; do cp -r $FILE ../$FILE; done
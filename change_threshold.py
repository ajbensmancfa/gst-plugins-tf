import yaml
import sys
import os

filename = os.path.dirname(os.path.realpath(__file__)) + '/data/tf_object_api_cfg.yml'
print(filename)
print()

stream = open(filename,'r')
data = yaml.load(stream)

data['threshold'] = float(sys.argv[1])

with open(filename, 'w') as file:
    file.write(yaml.dump(data, default_flow_style=False))

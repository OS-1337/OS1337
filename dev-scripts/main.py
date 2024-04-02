
# Main script to build OS1337
# This is an in progress rewrite of the bash scripts in 'scripts' in python.

import os
from pathlib import Path

import modules.config as config
import modules.util as util

print(config.main_dir)
print(config.build_dir)

util.make_base_dirs()
#util.make_minimal_filesystem()
util.make_fhs_filesystem()
# All global variables needed by multiple scripts go here.

import os
from pathlib import Path

cwd = Path.cwd().resolve()
main_dir = cwd.parent
build_dir = main_dir / 'build'

# Make configurable later.
profile_name = 'test_os'

profile_dir = build_dir / profile_name
rootfs_dir = profile_dir / 'rootfs'
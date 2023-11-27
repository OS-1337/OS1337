#! /usr/bin/env bash
echo 'Check for config file.'
if test -f .config; then
  echo "Copying kernel config."
  cp -v .config ../build/working/linux/
fi
cd ./../build/working/linux/
if test -f .config; then
  echo "Kernel config found."
else
 echo 'No config found. Generating 6.6.2-i486 tinyconfig.'
  make ARCH=x86 tinyconfig
fi

echo 'Please configure the Kernel...'
make ARCH=x86 menuconfig
echo 'Completed!'

echo 'Ready to compile for i486!'
cd ./../../../scripts

exit

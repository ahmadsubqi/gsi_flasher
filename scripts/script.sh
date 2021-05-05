#!/sbin/sh
#
# Copyright 2020 � soulr344
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Originally Coded by soulr344@XDAdevelopers
#
# Special thanks to corsicanu

dm=$1
gsi=`find /sdcard/.gsi -name *.img`

blockdev --setrw $1

if `simg2img $gsi $1`; then
  echo "INFO: Successfully flashed sparse image"
else
  dd if=$gsi of=$1 bs=4096
  echo "INFO: Successfully flashed raw image"
fi;

rm -rf /sdcard/.gsi
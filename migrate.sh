#!/usr/bin/env bash

# Copyright 2018 Dan Lew
# Copyright 2020 Brais Gabín
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
  echo "Usage: $0 [DIRECTORY]" >&2
  exit 1
fi

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
MAPPING_FILE=$SCRIPTPATH/rxjava3-class-mapping.csv

replace=""
while IFS=, read -r from to
do
	replace+="; s/$from/$to/g"
done <<< "$(cat $MAPPING_FILE)"

find $1 \( -name "*.kt" -o -name "*.java" \) -type f -not -path '*/\.git*' -print0 | xargs -0 sed -i '' "$replace"

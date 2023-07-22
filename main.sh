#!/bin/bash

input_text=$1

if [ -z $input_text ]; then
  echo "::error line=$LINENO::EmptyInput"
  exit 1
fi

# semverの仕様は以下を参照
# https://semver.org/

# semverとは関係のない無視する部分
left_text='^[^0-9]*'
right_text='.*$'
# 必須のversion部分
major_version='(0|[1-9][0-9]*)'
minor_version='(0|[1-9][0-9]*)'
patch_version='(0|[1-9][0-9]*)'
version_core="${major_version}\.${minor_version}\.${patch_version}"
# 任意のpre-release部分
pre_release='(-((0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*))*))'
# 任意のbuild部分
build='(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))'

regexp="s/${left_text}(${version_core}${pre_release}?${build}?)?${right_text}/\1/p"
result="$(echo $input_text | sed -nre $regexp)"

if [ -z $result ]; then
  echo "::error line=$LINENO::InvalidSemverFormat"
  exit 1
fi

echo $result

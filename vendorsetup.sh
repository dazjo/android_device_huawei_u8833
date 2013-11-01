# This whole script is a hack. Hoping to replace it soon.
if [ ! -z "$JENKINS_HOME" ]
then
  DEVICE_NAME=${LUNCH#*_} DEVICE_NAME=${DEVICE_NAME%-*}
  if [ "$DEVICE_NAME" == "u8833" ]
  then
    sh device/huawei/msm7x27a-common/patches/apply.sh
    sh device/huawei/u8833/patches/apply.sh
  fi
fi

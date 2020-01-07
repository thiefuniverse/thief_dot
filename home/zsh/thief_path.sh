#!/usr/bin/env bash

source /usr/local/toolchains/profile

SELF_TOOL_PATH=/home/sensetime/thief_work/tools/
export PATH=$PATH:$SELF_TOOL_PATH/platform-tools
export PATH=$PATH:$SELF_TOOL_PATH/android-studio/bin
ANDROID_SDK_PATH=/home/sensetime/thief_work/tools/android_ndk/Android
export PATH=$PATH:$ANDROID_SDK_PATH/Sdk/cmake/3.10.2.4988404/bin
export PATH=$PATH:$ANDROID_SDK_PATH/Sdk/ndk/20.0.5594570

export PATH=$PATH:/home/sensetime/big_repo/work_2018_branch/share_scripts/
#******thief plan settings begin******
export THIEF_HOME_PATH=/home/sensetime/thief_work/high_soft/thief_dot/home
alias setup.sh=/home/sensetime/thief_work/high_soft/thief_dot/setup.sh
. /home/sensetime/thief_work/high_soft/thief_dot/home/alias/alias.sh /home/sensetime/thief_work/high_soft/thief_dot/home
#******thief plan settings end******
export LC_CTYPE=zh_CN.UTF-8
export PATH=$PATH:/home/sensetime/big_repo/high_soft/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-14.04/bin

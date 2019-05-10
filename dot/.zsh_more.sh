export PATH=$PATH:/home/xiefei/highSoft/cppbuild-0.3.1-f3c7f5b-linux-x86_64
export PATH=$PATH:/usr/share/platform-tools:/home/xiefei/highSoft/bin:/home/xiefei/Android/Sdk/platform-tools/
export PATH=$PATH:/home/xiefei/beauty_scripts:/big_repo/high_soft/tools

export GOROOT=/usr/share/go-1.6/
export GOBIN=/usr/local/bin
export PATH=$PATH:$GOBIN

alias sz="source ~/.zshrc"
alias ce="cppbuild dep"
alias si="sudo apt-get install "
alias ct="cppbuild test"
alias jj="zz"
alias pimage2mp4="echo 'ffmpeg -r 25 -loop 1 -i ~/IMG_8679.JPG -pix_fmt yuv420p -vcodec libx264 -b:v 600k -r:v 25 -preset medium -crf 30 -s 720x576 -vframes 250 -r 25 -t 10 ~/a.mp4'"
alias sk="sudo kill "
alias mc="ll | grep model$ | awk '{print \$9}' | xargs -n 1 model_check"
alias a7gcc="/opt/android-armv7/bin/arm-linux-androideabi-gcc"
alias a7g++="/opt/android-armv7/bin/arm-linux-androideabi-g++"
alias sadbd="sudo ~/Android/Sdk/platform-tools/adb devices"
export JAVA_HOME=/usr/lib/jvm/java-8/
export JRE_HOME=${JAVA_HOME}/jre
export PATH=${JAVA_HOME}/bin:$PATH
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
alias getmymakefile="cp ~/makefile ./"

alias playyuv_raw="ffplay -f rawvideo -video_size "
alias playyuv_fast="ffplay -f rawvideo -video_size 640x480  -pix_fmt nv21"
alias csize="du -sh"
alias cl="cppbuild clean"
alias vzsh="vim ~/.zshrc"

alias covimage="convert -resize "
alias halfimage="convert -resize %50 "
alias vimsnippets="vim ~/.config/textsuggest/custom-words.json"
alias gch="git checkout "
alias sau="sudo apt-get update"
alias asl="adb shell"
alias alog="adb logcat > a.log"
alias aglog="cat a.log | grep "STFACE" > b.log"


alias m="make "
alias rb1="adb root;adb remount;"
alias rb2="adb shell rm -r /data/misc/camera/enroll_images;adb shell rm -r /data/misc/camera/unlock_data"
alias rb3="adb pull /data/misc/camera/enroll_images;adb pull /data/misc/camera/unlock_data"
alias arm-linux-androideabi-g++="/opt/android-armv7_16/bin/arm-linux-androideabi-g++"
alias cm="cppman "

##########################################################################################
# change ndk tool chain version for cppbuild
##########################################################################################
alias c7="sed -i  '2s/[#]*//g; 3s/path/#path/g' ~/.cppbuild/config; cat ~/.cppbuild/config"
alias c16="sed -i  '3s/[#]*//g; 2s/path/#path/g' ~/.cppbuild/config; cat ~/.cppbuild/config"


##########################################################################################
# projects short command for modifying src codes
##########################################################################################
# open and close log.hpp (set log level to trace), include log.hpp header in face_detect_class.cpp
alias oplogs="sed -i '36s/warn/trace/g' ./internal_sdk/include_static/log.hpp;\
	      echo 'changed line'; \
	      sed '36q;d'  ./internal_sdk/include_static/log.hpp; \
	      sed -i '17 a #define CONFIG_SDK_ENABLE_LOG' ./src/detection/face_detection_class.cpp; \
	      sed -i '18 a #include \"log.hpp\" ' ./src/detection/face_detection_class.cpp "
alias cllogs="sed -i '36s/trace/warn/g' ./internal_sdk/include_static/log.hpp; \
              echo 'changed line'; \
              sed '36q;d'  ./internal_sdk/include_static/log.hpp; \
	      sed -i '18,19d'  ./src/detection/face_detection_class.cpp 
"

alias gre="~/sh_files/grep_dir.sh "

alias packlog="bin/pack_log_recorder.sh"
alias gsl="git stash list"

export ANDROID_HOME=~/Android/Sdk/
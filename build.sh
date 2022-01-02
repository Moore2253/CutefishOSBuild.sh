#!/bin/bash
#case select test
echo '欢迎使用CutefishDE自动编译脚本，本脚本仅适用于官方CutefishOS，若编译出现错误可根据官方GitHub自行修改脚本内容再次编译，作者Moore本墨，版本1.0'
echo '提示：请输入项目前序号并回车以开始编译，输入24(quit)退出'

PS3='请选择你要编译的项目：'
echo $PS3

select i in filemanager dock fishui screenshot qt-plugins terminal launcher settings debinstaller icons gtk-themes daemon statusbar libcutefish core updator screenlocker texteditor calculator kwin-plugins videoplayer sddm-theme appmotor quit;do
    case $i in 
        filemanager)
        echo '开始编译filemanager'
        echo '正在检测是否有同名文件夹'
        if test -e ~/filemanager 
        then
         echo '检测到同名文件夹，正在删除'
         sudo rm -rf ~/filemanager
         echo '删除完毕，继续编译'
        else
         echo "无同名文件夹，继续编译"
        fi
        echo '正在安装依赖'
        sudo apt install build-essential cmake extra-cmake-modules libkf5kio-dev libkf5solid-dev libkf5windowsystem-dev qtbase5-dev qtbase5-private-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev qttools5-dev-tools
        echo '正在克隆项目'
        git clone https://github.com/cutefishos/filemanager.git
        echo '正在编译'
        cd filemanager
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        echo '编译完成，正在安装'
        sudo make install
        cd ~
        echo '文件管理器安装完成'
        ;;
        dock)
        git clone https://github.com/cutefishos/dock.git
        cd dock
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        fishui)
        sudo apt install libqt5x11extras5-dev libkf5windowsystem-dev qtbase5-private-dev libxcb1-dev libxcb-shape0-dev libxcb-icccm4-dev -y
        git clone https://github.com/cutefishos/fishui.git
        cd fishui
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        sudo apt install equivs devscripts --no-install-recommends
        sudo mk-build-deps -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        cd ~
        ;;
        screenshot)
        sudo apt install cmake qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev qttools5-dev-tools qml-module-qtquick-controls2 qml-module-qtquick2 qml-module-qtquick-layouts qml-module-qt-labs-platform qml-module-qt-labs-settings qml-module-qtqml qml-module-qtquick-window2 qml-module-qtquick-shapes qml-module-qtquick-dialogs qml-module-qtquick-particles2
        git clone https://github.com/cutefishos/screenshot.git
        cd screenshot
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        qt-plugins)
        git clone https://github.com/cutefishos/qt-plugins.git
        cd qt-plugins
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        cd ~
        ;;
        terminal)
        sudo apt install extra-cmake-modules qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev
        git clone https://github.com/cutefishos/terminal.git
        cd terminal
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        cd ~
        ;;
        launcher)
        sudo apt install gcc cmake qtbase5-dev qml-module-qtquick-controls2 qml-module-org-kde-kwindowsystem qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev libkf5windowsystem-dev
        git clone https://github.com/cutefishos/launcher.git
        cd launcher
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        settings)
        sudo apt install cmake debhelper extra-cmake-modules libicu-dev libcrypt-dev libfreetype6-dev libfontconfig1-dev libkf5networkmanagerqt-dev modemmanager-qt-dev qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev qttools5-dev-tools qml-module-qtquick-controls2 qml-module-qtquick2 qml-module-qtquick-layouts qml-module-qt-labs-platform qml-module-qt-labs-settings qml-module-qtqml qml-module-qtquick-window2 qml-module-qtquick-shapes qml-module-qtquick-dialogs qml-module-qtquick-particles2
        git clone https://github.com/cutefishos/settings.git
        cd settings
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        debinstaller)
        sudo apt install cmake debhelper qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev libqapt-dev libapt-pkg-dev
        git https://github.com/cutefishos/debinstaller.git
        cd debinstaller
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        icons)
        git https://github.com/cutefishos/icons.git
        cd icons
        mkdir build
        cd build
        cmake  ..
        make
        sudo make install
        cd ~
        ;;
        debinstaller)
        sudo apt install cmake debhelper qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev libqapt-dev libapt-pkg-dev
        git https://github.com/cutefishos/debinstaller.git
        cd debinstaller
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        gtk-themes)
        git https://github.com/cutefishos/gtk-themes.git
        cd gtk-themes
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        daemon)
        sudo apt install cmake libqapt-dev
        git https://github.com/cutefishos/daemon.git
        cd daemon
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        statusbar)
        sudo apt install libkf5windowsystem-dev -y
        git clone https://github.com/cutefishos/statusbar.git
        cd statusbar
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        libcutefish)
        sudo apt install qtbase5-dev qtquickcontrols2-5-dev modemmanager-qt-dev libqt5sensors5-dev libkf5networkmanagerqt-dev libkf5screen-dev libkf5bluezqt-dev libkf5kio-dev cmake qtdeclarative5-dev libcanberra-dev libpulse-dev libcanberra-pulse extra-cmake-modules qttools5-dev qttools5-dev-tools
        git clone https://github.com/cutefishos/libcutefish.git
        cd libcutefish
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        cd ~
        ;;
        core)
        sudo apt install extra-cmake-modules pkg-config xserver-xorg-input-libinput-dev libx11-xcb-dev libxcb1-dev libxcb-randr0-dev\
        libxcb-keysyms1-dev libxcursor-dev libxcb-xfixes0-dev libxcb-damage0-dev libxcb-composite0-dev libxcb-shm0-dev libxcb-util-dev\
        libxcb-image0-dev libxcb-dpms0-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-ewmh-dev libxcb-glx0-dev libxcb-record0-dev xserver-xorg-dev\
        xserver-xorg-input-synaptics-dev libxtst-dev libsm-dev libpolkit-qt5-1-dev libpolkit-agent-1-dev libkf5windowsystem-dev libkf5globalaccel-dev\
        libkf5coreaddons-dev libkf5idletime-dev libqt5x11extras5-dev qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev qttools5-dev-tools
        git clone https://github.com/cutefishos/core.git
        cd core
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        updator)
        sudo apt install cmake libqapt-dev
        git clone https://github.com/cutefishos/updator.git
        cd updator
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        screenlocker)
        sudo apt install libpam0g-dev libx11-dev -y
        git clone https://github.com/cutefishos/screenlocker.git
        cd screenlocker
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        texteditor)
        sudo apt install equivs curl git devscripts lintian build-essential automake autotools-dev --no-install-recommends
        sudo mk-build-deps -i -t "apt-get --yes" -r
        git clone https://github.com/cutefishos/texteditor.git
        cd texteditor
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        calculator)
        sudo apt-get install cmake gcc qtbase5-dev qtdeclarative5-dev qml-module-qtquick2 qml-module-qtquick-controls2
        git clone https://github.com/cutefishos/calculator.git
        cd calculator
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        cd ~
        ;;
        kwin-plugins)
        git clone https://github.com/cutefishos/kwin-plugins.git
        cd kwin-plugins
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        cd ~
        ;;
        videoplayer)
        git clone https://github.com/cutefishos/videoplayer.git
        cd videoplayer
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        sddm-theme)
        git clone https://github.com/cutefishos/sddm-theme.git
        cd sddm-theme
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        appmotor)
        sudo apt install cmake qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev libsystemd-dev libcap-dev
        git clone https://github.com/cutefishos/appmotor.git
        cd appmotor
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        cd ~
        ;;
        quit)
        break
        ;;
        *)
        echo "输入错误，请输入项目前序号或者输入24(quit)退出"
        ;;
    esac
done
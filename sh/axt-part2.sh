#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改openwrt登陆地址,把下面的 192.168.10.1 修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修改子网掩码
#sed -i 's/255.255.255.0/255.255.0.0/g' package/base-files/files/bin/config_generate

# 修改主机名字，把 GL-AXT1800 修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/GL-AXT1800/g' package/base-files/files/bin/config_generate

# ttyd自动登录
# sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# 默认打开WiFi
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 添加第三方应用
mkdir kiddin9
pushd kiddin9
git clone --depth=1 https://github.com/kiddin9/openwrt-packages .
popd

mkdir JiaY-shi
pushd JiaY-shi
git clone --depth=1 https://github.com/JiaY-shi/fancontrol .
popd

mkdir Modem-Support
pushd Modem-Support
git clone --depth=1 https://github.com/Siriling/5G-Modem-Support .
popd

mkdir MyConfig
pushd MyConfig
git clone --depth=1 https://github.com/Siriling/OpenWRT-MyConfig .
popd

mkdir package/community
pushd package/community

# 系统相关应用
#Cpufreq
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-cpufreq
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-lib-mac-vendor
mkdir cpufreq
mkdir luci-app-cpufreq
cp -rf ../../kiddin9/cpufreq/* cpufreq
cp -rf ../../kiddin9/luci-app-cpufreq/* luci-app-cpufreq
#Fan
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-fan
mkdir fancontrol
mkdir luci-app-fancontrol
cp -rf ../../JiaY-shi/fancontrol/* fancontrol
cp -rf ../../JiaY-shi/luci-app-fancontrol/* luci-app-fancontrol
#Poweroff
mkdir luci-app-poweroff
cp -rf ../../kiddin9/luci-app-poweroff/* luci-app-poweroff
#Diskman
mkdir luci-app-diskman
cp -rf ../../kiddin9/luci-app-diskman/* luci-app-diskman
#Fileassistant
mkdir luci-app-fileassistant
cp -rf ../../kiddin9/luci-app-fileassistant/* luci-app-fileassistant
#Guest-wifi
mkdir luci-app-guest-wifi
cp -rf ../../kiddin9/luci-app-guest-wifi/* luci-app-guest-wifi
#Onliner (need luci-app-nlbwmon)
mkdir luci-app-onliner
cp -rf ../../kiddin9/luci-app-onliner/* luci-app-onliner
#svn export https://github.com/rufengsuixing/luci-app-onliner/trunk luci-app-onliner
#Eqos
#svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-eqos
mkdir luci-app-eqos
cp -rf ../../kiddin9/luci-app-eqos/* luci-app-eqos
#Wolplus
mkdir luci-app-wolplus
cp -rf ../../kiddin9/luci-app-wolplus/* luci-app-wolplus
#WiFischedule
mkdir luci-app-wifischedule
cp -rf ../../kiddin9/luci-app-wifischedule/* luci-app-wifischedule
#RAMfree
mkdir luci-app-ramfree
cp -rf ../../kiddin9/luci-app-ramfree/* luci-app-ramfree
#终端
mkdir luci-app-ttyd
cp -rf ../../kiddin9/luci-app-ttyd/* luci-app-ttyd

# 存储相关应用
# Gowebdav
# svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-gowebdav

# 科学上网和代理应用
#SSR
# svn export https://github.com/fw876/helloworld/trunk helloworld
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ssr-plus
# mkdir luci-app-ssr-plus
# cp -rf ../../kiddin9/luci-app-ssr-plus/* luci-app-ssr-plus
# cp -rf ../../kiddin9/dns2socks/* dns2socks
# cp -rf ../../kiddin9/lua-neturl/* lua-neturl
# cp -rf ../../kiddin9/microsocks/* microsocks
# cp -rf ../../kiddin9/tcping/* tcping
# cp -rf ../../kiddin9/shadowsocksr-libev/* shadowsocksr-libev
# cp -rf ../../kiddin9/chinadns-ng/* chinadns-ng
# cp -rf ../../kiddin9/mosdns/* mosdns
# cp -rf ../../kiddin9/hysteria/* hysteria
# cp -rf ../../kiddin9/tuic-client/* tuic-client
# cp -rf ../../kiddin9/shadow-tls/* shadow-tls
# cp -rf ../../kiddin9/ipt2socks/* ipt2socks
# cp -rf ../../kiddin9/naiveproxy/* naiveproxy
# cp -rf ../../kiddin9/redsocks2/* redsocks2
# cp -rf ../../kiddin9/shadowsocks-rust/* shadowsocks-rust
# cp -rf ../../kiddin9/simple-obfs/* simple-obfs
# cp -rf ../../kiddin9/v2ray-plugin/* v2ray-plugin
# cp -rf ../../kiddin9/trojan/* trojan
#Passwall和Passwall2
# svn export https://github.com/xiaorouji/openwrt-passwall/trunk openwrt-passwall
# svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall
# svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2
#VSSR（Hello Word）
# svn export https://github.com/jerrykuku/lua-maxminddb/trunk lua-maxminddb
# svn export https://github.com/jerrykuku/luci-app-vssr/trunk luci-app-vssr
#OpenClash
# svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
# svn export https://github.com/Siriling/OpenWRT-MyConfig/trunk/configs/istoreos/general/applications/luci-app-openclash temp/luci-app-openclash
# cp -rf temp/luci-app-openclash/* luci-app-openclash
mkdir luci-app-openclash
cp -rf ../../kiddin9/luci-app-openclash/* luci-app-openclash
cp -rf ../../MyConfig/configs/istoreos/general/applications/luci-app-openclash/* luci-app-openclash
#加入OpenClash核心
chmod -R a+x $GITHUB_WORKSPACE/scripts/preset-clash-core.sh
if [ "$1" = "rk33xx" ]; then
    $GITHUB_WORKSPACE/scripts/preset-clash-core.sh arm64
elif [ "$1" = "rk35xx" ]; then
    $GITHUB_WORKSPACE/scripts/preset-clash-core.sh arm64
elif [ "$1" = "x86" ]; then
    $GITHUB_WORKSPACE/scripts/preset-clash-core.sh amd64
fi

# 去广告
#ADGuardHome（kiddin9）
# svn export https://github.com/kiddin9/openwrt-packages/trunk/adguardhome
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-adguardhome
mkdir luci-app-adguardhome
cp -rf ../../kiddin9/luci-app-adguardhome/* luci-app-adguardhome
cp -rf ../../MyConfig/configs/istoreos/general/applications/luci-app-adguardhome/* luci-app-adguardhome
sed -i 's/拦截DNS服务器/拦截DNS服务器（默认用户名和密码均为root）/' luci-app-adguardhome/po/zh_Hans/adguardhome.po
sed -i 's/+PACKAGE_$(PKG_NAME)_INCLUDE_binary:adguardhome//' luci-app-adguardhome/Makefile
#ADGuardHome（kenzok8）
# svn export https://github.com/kenzok8/openwrt-packages/trunk/adguardhome
# svn export https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome
# svn export https://github.com/Siriling/OpenWRT-MyConfig/trunk/configs/lede/general/applications/luci-app-adguardhome temp/luci-app-adguardhome
# cp -rf temp/luci-app-adguardhome/* luci-app-adguardhome
# sed -i 's/默认账号和密码均为：admin/默认用户名和密码均为root/' luci-app-adguardhome/po/zh-cn/AdGuardHome.po
# sed -i 's/网页管理账号和密码:admin ,端口:/端口/' luci-app-adguardhome/po/zh-cn/AdGuardHome.po
#dnsfilter
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-dnsfilter
#ikoolproxy
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-ikoolproxy

# docker应用
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-filebrowser
# rm -rf ../../customfeeds/luci/applications/luci-app-kodexplorer
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-kodexplorer
# rm -rf ../../customfeeds/packages/utils/verysync
# rm -rf ../../customfeeds/luci/applications/luci-app-verysync
# svn export https://github.com/kenzok8/small-package/trunk/verysync
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-verysync

# VPN服务器
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-ssr-mudb-server
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-ipsec-server
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-pptp-server
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-softethervpn

# DNS
# svn export https://github.com/kenzok8/small-package/trunk/mosdns
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-mosdns
# svn export https://github.com/kenzok8/small-package/trunk/smartdns
# svn export https://github.com/kenzok8/small-package/trunk/luci-app-smartdns

#内网穿透
#Zerotier
mkdir luci-app-zerotier
cp -rf ../../kiddin9/luci-app-zerotier/* luci-app-zerotier

# 其他
#Socat
mkdir luci-app-socat
cp -rf ../../kiddin9/luci-app-socat/* luci-app-socat
#Unblockneteasemusic
# svn export https://github.com/kiddin9/openwrt-packages/trunk/UnblockNeteaseMusic
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-unblockneteasemusic
mkdir UnblockNeteaseMusic
mkdir luci-app-unblockneteasemusic
cp -rf ../../kiddin9/UnblockNeteaseMusic/* UnblockNeteaseMusic
cp -rf ../../kiddin9/luci-app-unblockneteasemusic/* luci-app-unblockneteasemusic
#OpenAppFilter
# svn export https://github.com/destan19/OpenAppFilter/trunk OpenAppFilter

#硬件加速
mkdir pdnsd-alt
mkdir dnsforwarder
mkdir shortcut-fe
mkdir luci-app-turboacc
cp -rf ../../kiddin9/pdnsd-alt/* pdnsd-alt
cp -rf ../../kiddin9/dnsforwarder/* shortcut-dnsforwarder
cp -rf ../../kiddin9/shortcut-fe/* shortcut-fe
cp -rf ../../kiddin9/luci-app-turboacc/* luci-app-turboacc

#主题
mkdir luci-theme-argon
mkdir luci-app-argon-config
cp -rf ../../kiddin9/luci-theme-argon/* luci-theme-argon
cp -rf ../../kiddin9/luci-app-argon-config/* luci-app-argon-config

# iStore应用
mkdir taskd
mkdir luci-lib-taskd
mkdir luci-lib-xterm
mkdir luci-app-store
mkdir quickstart
mkdir luci-app-quickstart
cp -rf ../../kiddin9/taskd/* taskd
cp -rf ../../kiddin9/luci-lib-taskd/* luci-lib-taskd
cp -rf ../../kiddin9/luci-lib-xterm/* luci-lib-xterm
cp -rf ../../kiddin9/luci-app-store/* luci-app-store
cp -rf ../../kiddin9/quickstart/* quickstart
cp -rf ../../kiddin9/luci-app-quickstart/* luci-app-quickstart

# 5G通信模组拨号工具
mkdir quectel_QMI_WWAN
mkdir quectel_cm_5G
# mkdir quectel_MHI
# mkdir luci-app-hypermodem
cp -rf ../../Modem-Support/quectel_QMI_WWAN/* quectel_QMI_WWAN
cp -rf ../../Modem-Support/quectel_cm_5G/* quectel_cm_5G
# cp -rf ../../Modem-Support/quectel_MHI/* quectel_MHI
# cp -rf ../../Modem-Support/luci-app-hypermodem/* luci-app-hypermodem

# 5G模组短信插件
mkdir sms-tool
mkdir luci-app-sms-tool
cp -rf ../../Modem-Support/sms-tool/* sms-tool
cp -rf ../../Modem-Support/luci-app-sms-tool/* luci-app-sms-tool
cp -rf ../../MyConfig/configs/istoreos/general/applications/luci-app-sms-tool/* luci-app-sms-tool

# 5G模组管理插件
mkdir luci-app-modem
cp -rf ../../Modem-Support/luci-app-modem/* luci-app-modem
sed -i 's/+kmod-pcie_mhi \\//' luci-app-modem/Makefile
popd

# 5G模组拨号脚本
# mkdir -p package/base-files/files/root/5GModem
# cp -rf $GITHUB_WORKSPACE/tools/5G模组拨号脚本/5GModem/* package/base-files/files/root/5GModem
# echo -e "#* * * * * bash /root/5GModem/5g_crontab.sh" >> package/istoreos-files/files/etc/crontabs/root

find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
./scripts/feeds install -a

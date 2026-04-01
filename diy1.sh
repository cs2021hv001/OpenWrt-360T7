#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add feed sources
sed -i '$a src-git-full small https://github.com/kenzok8/jell.git' feeds.conf.default
#sed -i '$a src-git-full kenzok https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git-full xiaorouji_passwall https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default
#sed -i '$a src-git-full sbwml_mosdns https://github.com/sbwml/luci-app-mosdns.git' feeds.conf.default



#git clone https://github.com/MetaCubeX/subconverter.git package/subconverter



git clone https://github.com/CHN-beta/rkp-ipid package/rkp-ipid
git clone https://github.com/Zxilly/UA2F package/UA2F
# theme
# git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/

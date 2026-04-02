#!/bin/bash
###
 # @Author: xiawang1024
 # @Date: 2023-01-06 15:29:51
 # @LastEditTime: 2023-01-06 15:30:17
 # @LastEditors: xiawang1024
 # @Description: 
 # @FilePath: /OpenWrt-360T7/diy2.sh
 # 工作，生活，健康
### 
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

# Modify default IP
sed -i 's/192.168.6.1/192.168.88.7/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.88.7/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.1.1/192.168.88.7/g' ppackage/base-files/luci2/bin/config_generate
#sed -i "s/hostname='ImmortalWrt'/hostname='OpenWRT-360T7'/g" package/base-files/files/bin/config_generate
sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='OpenWrt By 神棍 $(date +"%Y%m%d")'/g" package/base-files/files/etc/openwrt_release

# 修改内存为 512M
#sed -i 's/0x10000000/0x20000000/' target/linux/mediatek/dts/mt7981b-360-t7.dts

# 打印修改后的内容，日志里能直接看到
#echo "===== 检查 DTS 内存配置 ====="
#grep -E "0x[0-9a-fA-F]+$" target/linux/mediatek/dts/mt7981b-360-t7.dts
#echo "============================"
# 360T7 改 512MB 内存（适配你当前这个极简DTS）
DTS_FILE="target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-360-t7.dts"

# 256MB → 512MB
sed -i 's|reg = <0 0x40000000 0 0x10000000>;|reg = <0 0x40000000 0 0x20000000>;|g' $DTS_FILE

# 输出确认修改成功
echo "===== 360T7 内存修改结果 ====="
grep "memory" $DTS_FILE -A 1


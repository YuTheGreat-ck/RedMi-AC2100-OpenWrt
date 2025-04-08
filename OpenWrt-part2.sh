#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# Modified by Gemini for user request
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: OpenWrt-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认 IP
sed -i 's/192.168.1.1/10.10.10.10/g' package/base-files/files/bin/config_generate

# 启用默认主题为 luci-theme-bootstrap (冰神主题)
sed -i 's/luci-theme-bootstrap/luci-theme-bootstrap/g' feeds/luci/collections/luci/Makefile

# 启用系统时区为 "Asia/Shanghai"
sed -i "/timezone/a\\\t\tset system.@system[-1].zonename='Asia\/Shanghai'" package/base-files/files/bin/config_generate

# 报错修复
ln -s /usr/bin/upx /workdir/openwrt/staging_dir/host/bin/

# 允许 root 用户编译
export FORCE_UNSAFE_CONFIGURE=1

echo "自定义配置完成："
echo "  - 默认 IP 地址已设置为: 10.10.10.10"
echo "  - 默认主题已设置为: luci-theme-bootstrap (冰神)"
echo "  - 系统时区已设置为: Asia/Shanghai"

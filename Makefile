#
# Copyright (C) 2017 Dan Luedtke <mail@danrl.com>
#
# This is free software, licensed under the GNU General Public License v2.

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI support for the MWAN3 MultiWAN Manager
LUCI_DEPENDS:=+luci-base +mwan3
PKG_LICENSE:=GPL-2.0
PKG_SRC_PREFIX:=$(shell date +%y).999
PKG_SRC_SUFFIX:=3.6.12
PKG_VERSION:=$(PKG_SRC_PREFIX).$(PKG_SRC_SUFFIX)
PKG_RELEASE:=2

PKG_MAINTAINER:=Florian Eckert <fe@dev.tdt.de>

# 优先从 feeds/luci 引入公共 luci.mk，若不存在则退回相对路径兼容官方 monorepo 结构
ifneq ($(wildcard $(TOPDIR)/feeds/luci/luci.mk),)
  include $(TOPDIR)/feeds/luci/luci.mk
else
  include ../../luci.mk
endif

# call BuildPackage - OpenWrt buildroot signature

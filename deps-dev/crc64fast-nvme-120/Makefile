# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025 Entware

# XXX (termscp)

include $(TOPDIR)/rules.mk

PKG_NAME:=crc64fast-nvme
PKG_VERSION:=1.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/awesomized/crc64fast-nvme/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=203e60c9d864e83735811f2ee166c1518373a8cb4da19c59fa31c7716f19f285

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-Apache LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/crc64fast-nvme-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=SIMD accelerated CRC-64/NVME checksum calculation
  URL:=https://github.com/awesomized/crc64fast-nvme
  BUILDONLY:=1
endef

define Package/crc64fast-nvme-$(PKG_VERSION)/description
  SIMD-accelerated carryless-multiplication CRC-64/NVME checksum
 computation (similar to crc32fast and forked from crc64fast which calculates
 CRC-64/XZ [a.k.a CRC-64/GO-ECMA]).
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,crc64fast-nvme-$(PKG_VERSION)))

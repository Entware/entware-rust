# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips (arti)

include $(TOPDIR)/rules.mk

PKG_NAME:=merlin
PKG_VERSION:=3.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/zkcrypto/merlin/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=c061f9804321df6aedc1ebe83a7753b7554fb0dfe5d8908e1d9dcdee886b0dc8

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.txt

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/merlin-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Composable proof transcripts
  URL:=https://github.com/zkcrypto/merlin
  BUILDONLY:=1
endef

define Package/merlin-$(PKG_VERSION)/description
  Composable proof transcripts for public-coin arguments of knowledge.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,merlin-$(PKG_VERSION)))

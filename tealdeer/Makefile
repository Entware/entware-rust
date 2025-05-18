# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=tealdeer
PKG_VERSION:=1.7.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dbrgn/tealdeer/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=d0675b9aa48c00e78abafc318b9bfbcb7ea3cce63e58a42c1f9e2395abcfe0e8

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/tealdeer
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a very fast implementation of tldr
  URL:=https://github.com/dbrgn/tealdeer
  DEPENDS:=+libopenssl
endef

define Package/tealdeer/description
  Fetch and show tldr help pages for many CLI commands.
  Full featured offline client with caching support.
endef

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/tealdeer/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/tldr $(1)/opt/usr/bin
endef

define Package/tealdeer/postinst
#!/bin/sh

### colors
ansi_red="\033[1;31m"
ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std" "Info:" "updating the local cache ..."
if ! tldr --update > /dev/null 2>&1 ; then
  printf "$$ansi_red %s $$ansi_std\n\n" "faild"
else
  printf "$$ansi_white %s $$ansi_std\n\n" "done"
fi
endef

$(eval $(call BuildPackage,tealdeer))

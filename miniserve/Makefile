# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=miniserve
PKG_VERSION:=0.26.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/svenstaro/miniserve/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=5ac3e7220c0c86c23af46326cf88e4d0dc9eb296ca201c47c4c3f01d607edf63

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/miniserve
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=a CLI tool to serve files and dirs over HTTP
  URL:=https://github.com/svenstaro/miniserve
endef

define Package/miniserve/description
  miniserve is a small, self-contained cross-platform CLI tool that
  allows you to just grab the binary and serve some file(s) via HTTP. 
endef

# FIXME
# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`
ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
CARGO_ARGS += --no-default-features
endif

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/miniserve/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/miniserve $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,miniserve))

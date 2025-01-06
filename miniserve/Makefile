# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=miniserve
PKG_VERSION:=0.28.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/svenstaro/miniserve/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=c4c5e12796bdae2892eff3832b66c4c04364738b62cf1429259428b03363d1f1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438

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

# mips(el): error: failed to run custom build command for `ring v0.16.20`
ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
CARGO_ARGS += --no-default-features
endif

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/miniserve/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/miniserve $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,miniserve))

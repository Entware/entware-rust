# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=qtun
PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/shadowsocks/qtun/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=9682778d74cb632f9eb7f254f64cd1d96ccc9edad60142a06b33aca004b66a01

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0215

define Package/qtun/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=SIP003 plugin based on IETF-QUIC
  URL:=https://github.com/shadowsocks/qtun
endef

define Package/qtun-client
  $(call Package/qtun/Default)
  TITLE+=(client)
endef

define Package/qtun-server
  $(call Package/qtun/Default)
  TITLE+=(server)
endef

define Package/qtun/description/Default
  Yet another SIP003 plugin based on IETF-QUIC.
endef

Package/qtun-client/description=$(call Package/qtun/description/Default)
Package/qtun-server/description=$(call Package/qtun/description/Default)

# cannot be used when making a shared object; recompile with -fPIC
RUSTFLAGS += -C relocation-model=pic
TARGET_CFLAGS += -fPIC

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/qtun-client/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/qtun-client $(1)/opt/usr/bin
endef

define Package/qtun-server/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/qtun-server $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,qtun-client))
$(eval $(call BuildPackage,qtun-server))

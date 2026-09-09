# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=atuin
PKG_VERSION:=18.21.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/atuinsh/atuin/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=05b18e62430f12cf55cb33edae98eb494eefce9ee124d48d2777ee0b1b8abede

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0444 getrandom-0217 getrandom-034 getrandom-042 iana-time-zone-0164 \
	metrics-exporter-prometheus-0181

define Package/atuin
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=magical shell history
  URL:=https://atuin.sh
  DEPENDS:=+libopenssl
endef

define Package/atuin/description
  Magical shell history.
endef

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

# sqlx proc macro links against the target OpenSSL and is loaded during build
RUSTC_VARS += LD_LIBRARY_PATH=/usr/lib/$(GNU_HOST_NAME):$(STAGING_DIR)/opt/lib:$(STAGING_DIR)/opt/lib/libintl-full/lib

# eye_declare and rmcp require 64-bit atomics
ifneq ($(CONFIG_ARCH_64BIT),y)
CARGO_ARGS += --package atuin --no-default-features \
	--features client,sync,clipboard,check-update,daemon,pty-proxy
endif

define Package/atuin/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/atuin $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,atuin))

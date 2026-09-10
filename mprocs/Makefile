# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=mprocs
PKG_VERSION:=0.9.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pvolok/mprocs/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=294fa02bfec7c73bc29448c55497ac46deda8b82bec259e492c51cfb67330c2d

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 getrandom-032 iana-time-zone-0159 rust-bindgen/host
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)
HOST_CFLAGS += $(HOST_FPIC)

define Package/mprocs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=TUI for running multiple processes
  URL:=https://github.com/pvolok/mprocs
  DEPENDS:=+libatomic
endef

define Package/mprocs/description
  mprocs runs multiple commands in parallel and shows output of
  each command separately.
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += -l dylib=atomic
endif

define Package/mprocs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/mprocs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,mprocs))

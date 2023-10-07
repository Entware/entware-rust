# SPDX-License-Identifier: WTFPL

# XXX since 0.13.0 needs libclang*.so*

include $(TOPDIR)/rules.mk

PKG_NAME:=zenith
PKG_VERSION:=0.12.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bvaisvil/zenith/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=2b33892be95149550c84179b341e304c4222e3489bc121ea8c8346e075433aa6

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/zenith
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=sort of like top or htop
  URL:=https://github.com/bvaisvil/zenith
endef

define Package/zenith/description
  In terminal graphical metrics for your *nix system written in Rust.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/zenith/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/zenith $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,zenith))

# SPDX-License-Identifier: WTFPL

# XXX https://github.com/keeperofdakeys/dns-lookup/issues/28
# aarch64/arm:
#	error[E0308]: mismatched types
#	error: could not compile `dns-lookup` due to 6 previous errors

include $(TOPDIR)/rules.mk

PKG_NAME:=turboscan
PKG_VERSION:=0.1.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=6f7e9ecf3c97bc728a6297f6bc649df76dfce794
PKG_SOURCE_URL:=https://github.com/vithalreddy/turboscan
PKG_MIRROR_HASH:=61265a84118ae8525c529d91fbed49e26cd8bb7a258cacb24ba0d12edd9ca1e4

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/turboscan
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A fast and reliable Rust-based port scanner CLI
  URL:=https://github.com/vithalreddy/turboscan
  DEPENDS:=@!(aarch64||arm)
endef

define Package/turboscan/description
  Turboscan is a blazingly fast and reliable Rust-based port scanner CLI
  for network administrators, security professionals and Developers.
endef

define Package/turboscan/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/turboscan $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,turboscan))

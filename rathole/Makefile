# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=rathole
PKG_VERSION:=0.4.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rapiz1/rathole/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=462ab2f036bccb13f02dfffcf3ac89de687c55f1392e36b2eabbe6bb70b80545

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/rathole
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A reverse proxy for NAT traversal
  URL:=https://github.com/rapiz1/rathole
  DEPENDS:=+libopenssl
endef

define Package/rathole/description
  A lightweight and high-performance reverse proxy for NAT traversal,
  written in Rust. An alternative to frp and ngrok.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/rathole/install
	$(INSTALL_DIR) $(1)/opt/etc/rathole
	$(CP) $(PKG_BUILD_DIR)/examples $(1)/opt/etc/rathole
	# remove unused
	rm -fr $(1)/opt/etc/rathole/examples/systemd
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rathole $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rathole))
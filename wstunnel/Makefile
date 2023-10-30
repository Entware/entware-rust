# SPDX-License-Identifier: WTFPL

# mips:
#	error: failed to run custom build command for `ring v0.17.5`

include $(TOPDIR)/rules.mk

PKG_NAME:=wstunnel
PKG_VERSION:=7.8.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/erebe/wstunnel/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=58226be5396658e364926b25256769e0d5e245321bdb35daffc561a7c89729c5

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/rust/cargo.mk

define Package/wstunnel
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tunneling over websocket protocol
  URL:=https://github.com/erebe/wstunnel
  DEPENDS:=+ca-certificates @!mips
endef

define Package/wstunnel/description
  Tunneling over websocket protocol.
endef

# FIXME
#	error[E0599]: no function or associated item named `now_v7` found for struct `Uuid` in the current scope
RUSTFLAGS += --cfg uuid_unstable

define Package/wstunnel/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/wstunnel $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,wstunnel))

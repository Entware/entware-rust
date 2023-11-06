# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=bandwhich
PKG_VERSION:=0.21.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/imsnif/bandwhich/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=8ba9bf6469834ad498b9fd17f86759a16793b00a6ef44edd6e525ec40adcb0b0

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/bandwhich
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Terminal bandwidth utilization tool
  URL:=https://github.com/imsnif/bandwhich
endef

define Package/bandwhich/description
  This is a CLI utility for displaying current network utilization by process,
  connection and remote IP/hostname.
endef

define Package/bandwhich/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/bandwhich $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,bandwhich))

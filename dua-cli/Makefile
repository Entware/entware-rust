# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=dua-cli
PKG_VERSION:=2.20.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Byron/dua-cli/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=05ce2d74ec1282803c6825b0436d8b268eef176060b844ae29746a3d338fe658

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/rust/cargo.mk

define Package/dua-cli
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=Disk Usage Analyzer
  URL:=https://github.com/Byron/dua-cli
endef

define Package/dua-cli/description
  dua (-> Disk Usage Analyzer) is a tool to conveniently learn
  about the usage of disk space of a given directory.
endef

define Package/dua-cli/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dua $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dua-cli))

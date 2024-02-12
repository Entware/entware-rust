# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=spider
PKG_VERSION:=1.80.71
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/spider-rs/spider/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=1458d8a63a584a2418983af14dde15a65ba3c27c1b3056c76f5a50e55c10f8fe

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/spider/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=https://github.com/spider-rs/spider
  DEPENDS:=+libopenssl
endef

define Package/spider-cli
  $(call Package/spider/Default)
  TITLE:=The fastest web crawler CLI
endef

define Package/spider-worker
  $(call Package/spider/Default)
  TITLE:=The fastest web crawler as a worker or proxy
endef

define Package/spider/description
  The fastest web crawler and indexer.
endef

define Package/spider-cli/description
  $(call Package/spider/description)
  A fast command line spider or crawler.
endef

define Package/spider-worker/description
  $(call Package/spider/description)
  A spider worker to decentralize the crawl lifting.
endef

define Package/spider-cli/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/spider $(1)/opt/usr/bin
endef

define Package/spider-worker/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/spider_worker $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,spider-cli))
$(eval $(call BuildPackage,spider-worker))

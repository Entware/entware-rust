# SPDX-License-Identifier: WTFPL

# XXX depends on "ring"

include $(TOPDIR)/rules.mk

PKG_NAME:=qtun
PKG_VERSION:=0.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/shadowsocks/qtun/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=498b7cf19373472c8f490958e1761c855ef6f84363d645862e02cbf4c15a7a35

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/qtun/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=SIP003 plugin based on IETF-QUIC
  URL:=https://github.com/shadowsocks/qtun
  DEPENDS:=@!(mips||mipsel)
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
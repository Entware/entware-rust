# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=dns-firewall
PKG_VERSION:=1.2.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/nthuemmel/dns-firewall-rust/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=43660203b481eb0d9177aacaaeb351eb67eb306951851600088faf4dd387e383

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

PKG_UNPACK:=$(HOST_TAR) -C "$(PKG_BUILD_DIR)" --strip-components=1 -xzf "$(DL_DIR)/$(PKG_SOURCE)"

define Package/dns-firewall
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Firewall
  TITLE:=Filtering DNS proxy server with firewall integration
  URL:=https://github.com/nthuemmel/dns-firewall-rust
  EXTRA_DEPENDS:=iptables, ipset
endef

define Package/dns-firewall/description
  dns-firewall is a filtering DNS proxy server integrating into iptables
  firewalls written in Rust.
endef

define Package/dns-firewall/conffiles
/opt/etc/dns-firewall/acl
endef

define Package/dns-firewall/install
	$(INSTALL_DIR) $(1)/opt/etc/dns-firewall
	$(CP) $(PKG_BUILD_DIR)/dist/shared/etc/dns-firewall/acl $(1)/opt/etc/dns-firewall

	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dns-firewall $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dns-firewall))

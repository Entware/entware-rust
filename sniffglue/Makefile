# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=sniffglue
PKG_VERSION:=0.15.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kpcyrd/sniffglue/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=ac30c0748a4247d2a36b82d623e88863480c300d3f6bbbdc303077240a8292c5

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

# FIXME
#	error: could not compile `sniffglue` (bin "sniffglue")
#	... (signal: 4, SIGILL: illegal instruction)
RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/sniffglue
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Secure multithreaded packet sniffer
  URL:=https://github.com/kpcyrd/sniffglue
  DEPENDS:=+libpcap
endef

define Package/sniffglue/description
  .
  sniffglue is a network sniffer written in rust. Network packets are parsed
  concurrently using a thread pool to utilize all cpu cores. Project goals are
  that you can run sniffglue securely on untrusted networks and that it must
  not crash when processing packets. The output should be as useful as possible
  by default.
endef

define Package/sniffglue/install
#	$(INSTALL_DIR) $(1)/opt/etc
#	$(INSTALL_CONF) $(PKG_BUILD_DIR)/sniffglue.conf $(1)/opt/etc

	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sniffglue $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,sniffglue))

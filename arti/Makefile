# SPDX-License-Identifier: WTFPL
#
# XXX mips(el): AtomicU64 not supported; breaks coarsetime

include $(TOPDIR)/rules.mk

PKG_NAME:=arti
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://gitlab.torproject.org/tpo/core/arti/-/archive/$(PKG_NAME)-v$(PKG_VERSION)
PKG_HASH:=68b8b391478b745d4bba50034d5122e2c7b90e0e221f52ba83c078901c83e55a

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

PKG_UNPACK:=$(HOST_TAR) -C "$(PKG_BUILD_DIR)" --strip-components=1 -xzf "$(DL_DIR)/$(PKG_SOURCE)"

define Package/arti
  SECTION:=net
  CATEGORY:=Network
  TITLE:=reimplementing Tor in Rust
  URL:=https://gitlab.torproject.org/tpo/core/arti/-/wikis/home
  DEPENDS:=@!(mips||mipsel) +liblzma +libopenssl +libsqlite3
endef

define Package/arti/description
  A rust implementation of the Tor privacy tools.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/arti/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/arti $(1)/opt/usr/bin

	$(INSTALL_DIR) $(1)/opt/etc/arti
	$(CP) $(PKG_BUILD_DIR)/crates/arti/src/arti-example-config.toml \
		$(1)/opt/etc/arti/arti-config.toml
endef

$(eval $(call BuildPackage,arti))

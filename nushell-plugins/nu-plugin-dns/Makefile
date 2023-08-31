# SPDX-License-Identifier: WTFPL

# XXX nu 0.80.0:
# arm:
#	error[E0599]: no variant or associated item named `filesize` found for enum `nu_protocol::Value` in the current scope
#	error[E0599]: no variant or associated item named `bool` found for enum `nu_protocol::Value` in the current scope
#	error: could not compile `nu_plugin_dns` (lib) due to 25 previous errors
# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-dns
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-08-25
PKG_SOURCE_VERSION:=13dafd35f3e6f0f688fada072ff291ed82e325c9
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/dead10ck/nu_plugin_dns
PKG_MIRROR_HASH:=1fdaafc4044205341b1d8dfc43efe295354e746f6b54fe5449f65fa1e0191048

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-dns
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A DNS utility for nushell
  URL:=https://github.com/dead10ck/nu_plugin_dns
  DEPENDS:=+nushell @(aarch64||i386||x86_64)
endef

define Package/nu-plugin-dns/description
  Nushell plugin that does DNS queries and parses results into meaningful types.
endef

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/nu-plugin-dns/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_dns \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-dns/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_dns'\n"
endef

$(eval $(call BuildPackage,nu-plugin-dns))

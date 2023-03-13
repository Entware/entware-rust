# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=ripgrep
PKG_VERSION:=13.0.0
PKG_RELEASE:=11

PKG_SOURCE_DATE:=2023-02-10
PKG_SOURCE_VERSION:=44fb9fce2c1ee1a86c450702ea3ca2952bf6c5a7

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/BurntSushi/ripgrep
PKG_MIRROR_HASH:=7592478b29de97ef6c88a57fde546fb4fab86a1685a5313dfa2f94356fe45b69

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE-MIT

PKG_CONFIG_DEPENDS:= \
	CONFIG_RIPGREP_PCRE2

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/ripgrep
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a line-oriented search tool
  URL:=https://github.com/BurntSushi/ripgrep
  DEPENDS:=+RIPGREP_PCRE2:libpcre2
endef

define Package/ripgrep/description
  .
  ripgrep is a line-oriented search tool that recursively searches the current
  directory for a regex pattern while respecting gitignore rules. ripgrep has
  first class support on Windows, macOS and Linux.
endef

define Package/ripgrep/config
config RIPGREP_PCRE2
	depends on PACKAGE_ripgrep
	bool "PCRE2 support"
	default n
endef

CARGO_ARGS += $(if $(CONFIG_RIPGREP_PCRE2),--features 'pcre2')

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/ripgrep/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rg $(1)/opt/bin
endef

$(eval $(call BuildPackage,ripgrep))

# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el <= v0.17)

include $(TOPDIR)/rules.mk

PKG_NAME:=ring
PKG_VERSION:=0.17.5
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-19
PKG_SOURCE_VERSION:=c3fda8b4dd57d658923c397c6cfaa33591f6f256
PKG_SOURCE_URL:=https://github.com/briansmith/ring
PKG_MIRROR_HASH:=7f4b8df1eada12964f67d2f73e86a46b75b2576d95400f5ffdea22187cd66b2f

PKG_LICENSE:=non-standard
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/ring-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Safe, fast, small crypto using Rust
  URL:=https://github.com/briansmith/ring
  BUILDONLY:=1
endef

define Package/ring-$(PKG_VERSION)/description
  Safe, fast, small crypto using Rust with BoringSSL's cryptography primitives.
endef

#define Build/Clean
#	$(SED) '/^\[patch/d;/^ring/d' $(CARGO_HOME)/config.toml
#endef

#define Build/Configure/Cargo
#	( \
#		if ! grep -q 'patch.crates-io' $(CARGO_HOME)/config.toml; then \
#			echo '[patch.crates-io]'; \
#		fi; \
#		if ! grep -q '^ring' $(CARGO_HOME)/config.toml; then \
#			echo 'ring = { path = "$(BUILD_DIR)/ring-0.17.5" }'; \
#		fi; \
#	) >> $(CARGO_HOME)/config.toml
#endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,ring-$(PKG_VERSION)))

# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX aarch64/x86_64 (wstunnel)

include $(TOPDIR)/rules.mk

PKG_NAME:=aws-lc-rs
PKG_VERSION:=0.21.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=aws-lc-sys/v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/aws/aws-lc-rs
PKG_MIRROR_HASH:=c2b25c04eea2897a73d91acb1e366d1b7c789335e3d0a2b465986e1a03e91723

PKG_LICENSE:=Apache-2.0 ISC
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/aws-lc-rs-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=AWS Libcrypto for Rust
  URL:=https://github.com/aws/aws-lc-rs
  BUILDONLY:=1
endef

define Package/aws-lc-rs-$(PKG_VERSION)/description
  aws-lc-rs is a cryptographic library using AWS-LC for its
 cryptographic operations. The library strives to be API-compatible with
 the popular Rust library named ring.
endef

CARGO_SOURCE_SUBDIR:=aws-lc-sys

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,aws-lc-rs-$(PKG_VERSION)))

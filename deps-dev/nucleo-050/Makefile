# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

# XXX mips(el) (helix)

include $(TOPDIR)/rules.mk

PKG_NAME:=nucleo
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-04-02
PKG_SOURCE_VERSION:=a82a24999b899e588a73da830d3a6957f0fbea2b
PKG_SOURCE_URL:=https://github.com/helix-editor/nucleo
PKG_MIRROR_HASH:=e2706d20f27b492a1eb62d0da6d48582918beced20f3392d08b94032e6f575ed

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/nucleo-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=A fast and convenient fuzzy matcher library for rust
  URL:=https://github.com/helix-editor/nucleo
  BUILDONLY:=1
endef

define Package/nucleo-$(PKG_VERSION)/description
  A fast and convenient fuzzy matcher library for rust.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,nucleo-$(PKG_VERSION)))

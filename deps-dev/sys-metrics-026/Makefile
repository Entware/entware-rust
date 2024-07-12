# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX aarch64/arm (ztui)

include $(TOPDIR)/rules.mk

PKG_NAME:=sys-metrics
PKG_VERSION:=0.2.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2022-06-12
PKG_SOURCE_VERSION:=b5f56f127dc094456250fcae625f1fc24234ca06
PKG_SOURCE_URL:=https://github.com/Martichou/sys_metrics
PKG_MIRROR_HASH:=e2f342828b111d26121ca616465082d93251e30ef662583cdaa23c0c7a1f3af0

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/sys-metrics-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Gather metrics from the host
  URL:=https://github.com/Martichou/sys_metrics
  BUILDONLY:=1
endef

define Package/sys-metrics-$(PKG_VERSION)/description
  Cross-platform library to gather stats/information from the host.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_arm)),y)
  define Build/Prepare
	$(Build/Prepare/Default)
	patch -p1 -d $(PKG_BUILD_DIR) < ./patches-arm/010-fix.patch
  endef
endif

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,sys-metrics-$(PKG_VERSION)))

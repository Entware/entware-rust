# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# XXX mips (atuin)

include $(TOPDIR)/rules.mk

PKG_NAME:=metrics-exporter-prometheus
PKG_VERSION:=0.18.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/metrics-rs/metrics/tar.gz/$(PKG_NAME)-v$(PKG_VERSION)?
PKG_HASH:=72799ae3988b505b60fe131ccee72e99ac3e8c1a065a10a22f4ca9f936fa4ee7

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 getrandom-0215 getrandom-032 iana-time-zone-0161
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/metrics-exporter-prometheus-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=a metrics-compatible exporter
  URL:=https://github.com/metrics-rs/metrics
  BUILDONLY:=1
endef

define Package/metrics-exporter-prometheus-$(PKG_VERSION)/description
  A metrics-compatible exporter for sending metrics to Prometheus.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,metrics-exporter-prometheus-$(PKG_VERSION)))

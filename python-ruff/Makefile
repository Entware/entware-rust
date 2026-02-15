# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=ruff
PKG_VERSION:=0.13.0
PKG_RELEASE:=1

PYPI_NAME:=ruff
PKG_HASH:=5b4b1ee7eb35afae128ab94459b13b2baaed282b1fb0f472a73c82c996c8ae60

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=maturin/host
HOST_PATCH_DIR:=

PKG_BUILD_DEPENDS:= \
	chrono-0441 get-size2-062 getrandom-0216 getrandom-033 \
	iana-time-zone-0163 maturin/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-ruff
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=An extremely fast Python linter and code formatter
  URL:=https://docs.astral.sh/ruff
  DEPENDS:=+python3-light
#  EXTRA_DEPENDS:=maturin
endef

define Package/python3-ruff/description
  An extremely fast Python linter and code formatter, written in Rust.
endef

# error: linking with `x86_64-*-linux-gnu-gcc` failed: exit status: 1
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += -C relocation-model=pic
endif

define Package/python3-ruff/postrm
#!/bin/sh

rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME) || true
rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)-$(PKG_VERSION).dist-info || true
endef

$(eval $(call HostBuild))
$(eval $(call Py3Package,python3-ruff))
$(eval $(call BuildPackage,python3-ruff))
#$(eval $(call BuildPackage,python3-ruff-src))

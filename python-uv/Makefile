# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=uv
PKG_VERSION:=0.9.26
PKG_RELEASE:=1

PYPI_NAME:=uv
PKG_HASH:=8b7017a01cc48847a7ae26733383a2456dd060fc50d21d58de5ee14f6b6984d7

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

PKG_BUILD_DEPENDS:=boxcar-027 getrandom-0216 getrandom-033 maturin/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-uv
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=An extremely fast Python package and project manager
  URL:=https://pypi.org/project/uv/
  DEPENDS:= \
	+python3-asyncio \
	+python3-ctypes \
	+python3-logging \
	+python3-setuptools \
	+python3-urllib
  EXTRA_DEPENDS:=coreutils-env, maturin
endef

RUSTFLAGS += -C relocation-model=pic

define Package/python3-uv/description
  An extremely fast Python package and project manager, written in Rust.
endef

define Package/python3-uv/postrm
#!/bin/sh

rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME) || true
rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)-$(PKG_VERSION).dist-info || true
endef

$(eval $(call Py3Package,python3-uv))
$(eval $(call BuildPackage,python3-uv))
#$(eval $(call BuildPackage,python3-uv-src))

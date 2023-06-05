# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=semantic-version
PKG_VERSION:=2.10.0
PKG_RELEASE:=1

PYPI_NAME:=semantic_version
PKG_HASH:=bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2690d9a997ed5041c

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_HOST_ONLY:=1
HOST_BUILD_DEPENDS:=python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-semanticversion
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=A library implementing the 'SemVer' scheme
  URL:=https://github.com/rbarrois/python-semanticversion
  DEPENDS:=+python3
  BUILDONLY:=1
endef

define Package/python3-semanticversion/description
  This small python library provides a few tools to handle SemVer in Python.
  It follows strictly the 2.0.0 version of the SemVer scheme.
endef

$(eval $(call Py3Package,python3-semanticversion))
$(eval $(call BuildPackage,python3-semanticversion))
#$(eval $(call BuildPackage,python3-semanticversion-src))
$(eval $(call HostBuild))

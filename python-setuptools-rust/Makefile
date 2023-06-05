# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=setuptools-rust
PKG_VERSION:=1.6.0
PKG_RELEASE:=1

PYPI_NAME:=setuptools-rust
PKG_HASH:=c86e734deac330597998bfbc08da45187e6b27837e23bd91eadb320732392262

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_HOST_ONLY:=1
HOST_BUILD_DEPENDS:=python-semanticversion/host python-typing-extensions/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-setuptools-rust
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Setuptools Rust extension plugin
  URL:=https://github.com/PyO3/setuptools-rust
  DEPENDS:=+python3
  BUILDONLY:=1
endef

define Package/python3-setuptools-rust/description
  setuptools-rust is a plugin for setuptools to build Rust
  Python extensions implemented with PyO3 or rust-cpython.
endef

$(eval $(call Py3Package,python3-setuptools-rust))
$(eval $(call BuildPackage,python3-setuptools-rust))
#$(eval $(call BuildPackage,python3-setuptools-rust-src))
$(eval $(call HostBuild))

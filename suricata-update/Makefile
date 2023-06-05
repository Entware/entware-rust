# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=suricata-update
PKG_VERSION:=1.2.6
PKG_RELEASE:=2

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=846e990b702308814932f1f803b9fa8a212ae415d5abc834962597295ad16de3

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=python-yaml/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/suricata-update
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Suricata Update Tool (python)
  URL:=https://github.com/OISF/suricata-update
  DEPENDS:= \
	+python3-dateutil \
	+python3-logging \
	+python3-openssl \
	+python3-urllib \
	+python3-yaml
endef

define Package/suricata-update/description
  The tool for updating your Suricata rules.
endef

$(eval $(call Py3Package,suricata-update))
$(eval $(call BuildPackage,suricata-update))
#$(eval $(call BuildPackage,suricata-update-src))

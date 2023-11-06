# SPDX-License-Identifier: WTFPL

# mips(el)/armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `nucleo` (lib) due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=helix
PKG_VERSION:=23.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/helix-editor/helix/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=a1a98b24692ba8fc648245bebc3511b27eb4edf9eb97d97d8aed7157316d01e8

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/helix
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Editors
  TITLE:=A post-modern modal text editor
  URL:=https://helix-editor.com
  DEPENDS:=+libstdcpp @!(mips||mipsel||TARGET_armv5_3_2)
endef

define Package/helix/description
  A Kakoune/Neovim inspired editor, written in Rust.
endef

define Package/helix/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hx $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/share/helix
	$(CP) $(PKG_BUILD_DIR)/runtime $(1)/opt/share/helix
	rm -fr $(1)/opt/share/helix/runtime/grammars/sources
endef

define Package/helix/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_std="\033[0m"

printf "\t$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "create a symlink in \$$HOME, e.g.:"
printf "\t$$ansi_white %s $$ansi_std\n" "ln -snf /opt/share/helix ~/.config/helix"
endef

$(eval $(call BuildPackage,helix))

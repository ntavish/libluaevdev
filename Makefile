include $(TOPDIR)/rules.mk

PKG_NAME:=libluaevdev
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS := +lua

include $(INCLUDE_DIR)/package.mk

define Package/libluaevdev
	CATEGORY:=Libraries
	DEFAULT:=y
	TITLE:=libluaev
	URL:=https://github.com/ynezz/luaevdev
	DEPENDS:= +lua +liblua +libc
endef

define Package/libluaevdev/description
Lua library for handling linux input subsystem.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	cp src/* $(PKG_BUILD_DIR)/
endef


define Package/libluaevdev/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) -m0755 $(PKG_BUILD_DIR)/evdev_core.so $(1)/usr/lib/lua/
	$(INSTALL_BIN) -m0755 $(PKG_BUILD_DIR)/evdev.lua $(1)/usr/lib/lua/
endef

$(eval $(call BuildPackage,libluaevdev))

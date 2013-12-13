LIBLUAEVDEV_CFLAGS      = $(CFLAGS) -std=gnu99 -fstrict-aliasing -fPIC -I$(STAGING_DIR)/usr/include

LIBLUAEVDEV_LUA         = evdev_core.so
LIBLUAEVDEV_LUA_LDFLAGS = $(LDFLAGS) -shared -L. -L$(STAGING_DIR)/usr/lib -llua
LIBLUAEVDEV_LUA_OBJ     = evdev_core.o

%.o: %.c
	$(CC) $(LIBLUAEVDEV_CFLAGS) -c -o $@ $<

compile: clean $(LIBLUAEVDEV_LUA_OBJ)
	@echo $(CC)
	$(CC) $(LIBLUAEVDEV_LUA_LDFLAGS) -o $(LIBLUAEVDEV_LUA) $(LIBLUAEVDEV_LUA_OBJ)

clean:
	rm -f *.o $(LIBLUAEVDEV_LUA) 

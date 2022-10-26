
NAME = nclock22
TEMP_LUA = out.lua
OUT_FILE = $(NAME).tns

all: clean build upload

build:
	sol -a build .
	luna $(TEMP_LUA) $(OUT_FILE)

clean:
	$(RM) $(TEMP_LUA) $(OUT_FILE)

upload:
	PATH="/media/secret/alex/.local/bin:$(PATH)" uploadnspire $(OUT_FILE)

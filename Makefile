# Makefile author : Tristan.G
# Auto-build C/Assembly project
# Usage: make [all|clean|debug|export|help|init]
# Date: 16/02/2023
# Version: 1.0

# change this to your binary name
TARGET = executable

BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
CFLAGS = 

SRC_C = $(wildcard src/*.c)
SRC_ASM = $(wildcard src/*.asm)

OBJ_C = $(patsubst src/%.c, $(OBJ_DIR)/%.o, $(SRC_C))
OBJ_ASM = $(patsubst src/%.asm, $(OBJ_DIR)/%.o, $(SRC_ASM))

all: $(TARGET)

prepare:
	@echo "Preparing..."
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(OBJ_DIR)
	@echo "Done."

$(TARGET): $(OBJ_C) $(OBJ_ASM) prepare
	@echo "Linking..."
	@gcc -o $(BUILD_DIR)/$(TARGET) $(OBJ_C) $(OBJ_ASM)
	@echo "Done."

$(OBJ_DIR)/%.o: src/%.c prepare
	@echo "Compiling $<..."
	@gcc -c $< -o $@ $(CFLAGS)
	@echo "Done."

$(OBJ_DIR)/%.o: src/%.asm prepare
	@echo "Assembling $<..."
	@nasm -f elf64 $< -o $@
	@echo "Done."

clean:
	@echo "Cleaning..."
	@rm -rf $(BUILD_DIR)
	@echo "Done."

debug: CFLAGS += -DDEBUG -g
debug: all

export: clean
	@rm -f $(TARGET).zip
	@echo "Exporting..."
	@zip -r $(TARGET).zip *
	@echo "Done."

help:
	@echo "Usage: make [all|clean|debug|export|help|init]"
	@echo "all: build the project"
	@echo "clean: remove build directory"
	@echo "debug: build the project with debug flags"
	@echo "export: export the project to a zip file"
	@echo "init: create the project structure"
	@echo "help: display this help"

init:
	@echo "Initializing..."
	@mkdir -p src
	@echo "Done."
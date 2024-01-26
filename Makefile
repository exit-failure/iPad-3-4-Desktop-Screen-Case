#
# Attention:
# $(SCAD_FILE) $(SRC_DIR) and $(LIB_DIR) must always be paths relative to the location of this makefile
# Always use $(DELIM) instead of hard coded path delimiters to maintain portability.
#

# make this makefile executable from anywhere
.SHELLFLAGS = -ec
.ONESHELL:
MKFL_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# check for OS
# DELIM: os dependent path delimiter
# *NIX like
ifneq ($(OS),Windows_NT)
	ENVI = nix
	DELIM = /
# Windows with NT Kernel (NT, 2000, XP, Windows Server, Vista, 7, 8, 10, 11, ...)
# Check for unix-like environments. In some cases (e.g. git bash on Windows) some windows commands cannot be used
else ifeq (,$(findstring $(shell uname),MINGW))
	ENVI = nix_win
	DELIM = /
else ifeq (,$(findstring $(shell uname),MSYS))
	ENVI = msys
	DELIM = /
else
	ENVI = win
	DELIM = \\
endif

################################################################################################################################
#
# Do not put anything above this line except you know what you are doing.
# Otherwise, the portability of this makefile might break if you use hard coded path delimiter insted of %(DELIM), for instance.
#
################################################################################################################################

# the file from which the models should be created
SCAD_FILE = case.scad

# the open scad binary (include path, if not in environment)
SCAD_BIN = openscad

# additional open scad command line arguments
SCAD_FLAGS = -m make -d $@.$(DEP_EXT)

# fetch makefile path to get around problems if make is called from another directory than the project's root where Makefile is located
MKFL_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# the directory where $(SCAD_FILE) is located
SRC_DIR = src

# the directory where the required libraries can be found
LIB_DIR = lib

# the required dependencies
LIBS = measurements.scad

# the output file extension
OUT_EXTENSION = stl

# the output directory
OUT_DIR = out

# the tragets that should be built
TARGET_LIST = screen_front screen_back mainboard_front mainboard_back led_board_front led_board_back

# a list of all entries in $(TARGET_LIST) including the output file extension
OUT_FILE_LIST_SUFFIX = $(addsuffix .$(OUT_EXTENSION), $(TARGET_LIST))

# a list of all entries in $(TARGET_LIST) including the full absolute path and output file extension
OUT_FILE_LIST_SUFFIX_OUT_DIR = $(addprefix $(OUT_DIR)$(DELIM), $(OUT_FILE_LIST_SUFFIX))

# dependency files for speeding up the build process
DEP_EXT = deps

.PHONY: all fresh from-scratch clean purge always_do del_build_files del_dep_files make_out_dir

all: $(OUT_FILE_LIST_SUFFIX)

fresh:
	clean
	all

from-scratch:
	purge
	all

# generic build target
# $(OUT_DIR) as a dependency will call the outdir creation target if the directory is not present
%.stl: always_do $(OUT_DIR)
	echo $(OUT_FILE_LIST_SUFFIX_OUT_DIR)
ifneq ($(ENVI), win)
	$(SCAD_BIN) $(SCAD_FLAGS) -D 'model="$@"' -o $(OUT_DIR)$(DELIM)$@ $(SRC_DIR)$(DELIM)$(SCAD_FILE)
else
	$(SCAD_BIN) $(SCAD_FLAGS) -D "model=""$@""" -o $(OUT_DIR)$(DELIM)$@ $(SRC_DIR)$(DELIM)$(SCAD_FILE)
endif

# create outdir
$(OUT_DIR): always_do
ifneq ($(ENVI), win)
	mkdir -p $(OUT_DIR)
else
	mkdir $(OUT_DIR)
endif

# Delete all files generated by this script but leave $(OUT_DIR) intact since the user might have created other fiiles there.
clean: always_do del_build_files del_dep_files

# Delete $(OUT_DIR) and all files therein.
purge: always_do clean
ifneq ($(ENVI), win)
	rm -rf $(OUT_DIR)
else
	DEL /F /S $(OUT_DIR)
endif

# delete all files specified in $(OUT_FILE_LIST_SUFFIX_OUT_DIR)
del_build_files:
ifneq ($(ENVI), win)
	rm -f $(OUT_FILE_LIST_SUFFIX_OUT_DIR)
else
	DEL /F $(OUT_FILE_LIST_SUFFIX_OUT_DIR)
endif

# delete all files specified in $(DEPFILES)
del_dep_files:
ifneq ($(ENVI), win)
	rm -rf \*.$(DEP_EXT)
else
	DEL /F /S \*.$(DEP_EXT)
endif

# this should always be executed
always_do: make_out_dir

make_out_dir:
	cd $(MKFL_DIR)
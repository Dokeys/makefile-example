CC        := gcc
LD        := gcc

CFLAGS    := -Wall -g

BIN_FILE  := bin/program.exe
MODULES   := main application

SRC_DIR   := $(addprefix src/,$(MODULES))
BUILD_DIR := $(addprefix build/,$(MODULES))

SRC       := $(foreach sdir,$(SRC_DIR),$(wildcard $(sdir)/*.c))
OBJ       := $(patsubst src/%.c,build/%.o,$(SRC))
INCLUDES  := $(addprefix -I,$(SRC_DIR))

vpath %.c $(SRC_DIR)

define make-goal
$1/%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $$< -o $$@
endef

.PHONY: all checkdirs clean

all: checkdirs $(BIN_FILE)
 
$(BIN_FILE): $(OBJ)
	$(LD) $(CFLAGS) $^ -o $@


checkdirs: $(BUILD_DIR)

$(BUILD_DIR):
	@mkdir -p $@

clean:
	@rm -rf $(BUILD_DIR) $(BIN_FILE)

$(foreach bdir,$(BUILD_DIR),$(eval $(call make-goal,$(bdir))))

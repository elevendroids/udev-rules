Q ?= @

DEST_DIR := /etc/udev/rules.d
RULES := $(addprefix $(DEST_DIR)/, $(wildcard *.rules))

$(DEST_DIR)/%.rules: %.rules
	$(Q)echo "[INSTALL] $<"
	$(Q)install -o root -g root -m 644 $< $(DEST_DIR)

install: $(RULES)
	$(Q)echo "Reloading udev rules..."
	$(Q)udevadm control --reload
	$(Q)echo "Done."

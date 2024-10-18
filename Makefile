SRC = rfc

# Installation directory for the script
INSTALL_DIR = /usr/local/bin

# Full path to the script after installation
INSTALL_PATH = $(INSTALL_DIR)/$(SRC)

# Default target: install the script
install:
	# Copy the script to the installation directory
	install -m 755 $(SRC) $(INSTALL_DIR)
	@echo "$(SRC) installed to $(INSTALL_PATH)"

# Target to uninstall the script
uninstall:
	rm -f $(INSTALL_PATH)
	@echo "$(SRC) uninstalled"

# PHONY targets (targets that are not actual files)
.PHONY: install uninstall

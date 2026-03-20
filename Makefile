.PHONY: new

## Usage: make new NAME=<setting-name>
new:
	@[ -n "$(NAME)" ] || { echo "Error: NAME is required."; exit 1; }
	@[ ! -d "$(NAME)" ] || { echo "Error: '$(NAME)' already exists."; exit 1; }
	mkdir -p "$(NAME)/shared-files"
	touch "$(NAME)/shared-files/.gitkeep"
	printf '#!/usr/bin/env bash\nset -euo pipefail\n\n# TODO: implement\n' > "$(NAME)/run.sh"
	chmod +x "$(NAME)/run.sh"
	@echo "Created: $(NAME)/"

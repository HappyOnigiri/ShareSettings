.PHONY: new

## Usage: make new NAME=<setting-name>
new:
	@[ -n "$(NAME)" ] || { echo "Error: NAME is required. Usage: make new NAME=<setting-name>"; exit 1; }
	@[ ! -d "$(NAME)" ] || { echo "Error: '$(NAME)' already exists."; exit 1; }
	mkdir -p "$(NAME)/shared-files"
	touch "$(NAME)/shared-files/.gitkeep"
	@echo "Created: $(NAME)/"
	@echo "  $(NAME)/shared-files/   <- ここに配布ファイルを追加してください"

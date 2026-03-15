.PHONY: new

## Usage: make new NAME=<setting-name>
new:
	@[ -n "$(NAME)" ] || { echo "Error: NAME is required. Usage: make new NAME=<setting-name>"; exit 1; }
	@[ ! -d "$(NAME)" ] || { echo "Error: '$(NAME)' already exists."; exit 1; }
	mkdir -p "$(NAME)/shared-files"
	cp scripts/templates/action.yml "$(NAME)/action.yml"
	name_escaped=$$(printf '%s' "$(NAME)" | sed 's|[/&]|\\&|g'); \
	tmpfile=$$(mktemp "$(NAME)/action.yml.XXXXXX"); \
	sed "s/{{NAME}}/$$name_escaped/g" "$(NAME)/action.yml" > "$$tmpfile" && mv "$$tmpfile" "$(NAME)/action.yml"
	touch "$(NAME)/shared-files/.gitkeep"
	@echo "Created: $(NAME)/"
	@echo "  $(NAME)/action.yml"
	@echo "  $(NAME)/shared-files/   <- ここに配布ファイルを追加してください"

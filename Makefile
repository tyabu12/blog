BLOG='tyabu.hatenablog.jp'

.PHONY: pull
pull:
	blogsync pull $(BLOG)

.PHONY: gen_config
gen_config:
	./gen_blogsync_yaml.sh

.PHONY: push_all
push_all:
	./push_all_entries.sh

BLOG='tyabu.hatenablog.jp'

.PHONY: pull
pull:
	blogsync pull $(BLOG)

.PHONY: push
push:
	blogsync push $(BLOG)

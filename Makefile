BLOG='tyabu.hatenablog.jp'

.PHONY: pull
pull:
	blogsync pull $(BLOG)

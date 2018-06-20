#/bin/bash

find . -name "*.md" -mindepth 2 | while read line; do blogsync push $line; done

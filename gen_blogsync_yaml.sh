#!/bin/bash

cat << END > blogsync.yaml
${BLOG_URL}:
  username: ${USER_NAME}
  password: ${API_KEY}
default:
  local_root: `pwd`
END

#!/bin/bash

set -e

cat << END > ./blogsync.yaml
${BLOG_URL?undefined}:
  username: ${USER_NAME?undefined}
  password: ${API_KEY?undefined}
default:
  local_root: `pwd`
END

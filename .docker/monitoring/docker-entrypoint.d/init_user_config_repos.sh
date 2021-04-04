#!/usr/bin/env bash

set -e
set -u
set -o pipefail

cat > /src/config/user_config_repos.ini <<EOF


#[repo_1]
#repo_name = Bitsong SDK
#repo_page = cosmos/cosmos-sdk/
#include_in_github_monitor = false

EOF
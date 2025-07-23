#!/bin/bash
# https://gist.github.com/judy2k/c439633a6fab5ad57b2f0f86f23df78c
# This script prints out the packages that have been installed by homebrew,
# along with a description of each package.
#
# This doesn't include packages that were installed as dependencies,
# only packages requested explicitly by the user.
#
# This script requires the following packages: jq, qsv

# https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425
set -euo pipefail

brew info --installed --json | jq --raw-output "map(
    select(.installed.[].installed_on_request == true)
    | {name, desc})
" | qsv json | tail -n +1 | qsv table
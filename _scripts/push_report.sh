#!/usr/bin/env bash
set -ex
type git
[ $# -ne 2 ] && { echo "Usage: $0 (branch) (message)"; exit 1; }
ROOT="$(git rev-parse --show-toplevel)"
CHK="$1"
MSG="$2"

cd "$ROOT"
git add -vA *.txt *.gif
git checkout -mB "$CHK" master
EDITOR=cat git pull origin "$CHK"
git commit -vm "$MSG" -a && git push -v origin "$CHK"
times
echo "$0 done."

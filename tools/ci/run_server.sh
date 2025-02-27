#!/bin/bash
set -euo pipefail
EXIT_CODE=0

tools/deploy.sh ci_test
mkdir ci_test/config

#test config
cp tools/ci/ci_config.txt ci_test/config/config.txt

cd ci_test
DreamDaemon tgstation.dmb -close -trusted -verbose -params "log-directory=ci" || EXIT_CODE=$?

cd ..
cat ci_test/data/logs/ci/clean_run.lk

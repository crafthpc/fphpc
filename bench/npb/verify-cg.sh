#!/bin/bash
#
# Verification routine for NPB CG benchmark
#
# Usage: ./check.sh path/to/cg-exe
#

EXE_NAME="$1"
TMP_FILE="stdout.tmp"

# run benchmark w/ timer and save output
if [[ -e "${EXE_NAME}" ]]; then
    t_start=$(date +%s.%3N)
    ${EXE_NAME} >"${TMP_FILE}"
    exit_code=$?
    t_stop=$(date +%s.%3N)
    runtime=$(echo "$t_stop - $t_start" | bc)
fi

# extract error
error="$(grep "Error is" "${TMP_FILE}" | awk '{print $3}')"

# extract pass/fail status
if [[ ! -e "${EXE_NAME}" || $exit_code -ne 0 ]]; then
    stat="error"
else
    if [[ -n $(grep "VERIFICATION SUCCESSFUL" "${TMP_FILE}") ]]; then
        stat="pass"
    else
        stat="fail"
    fi
fi

# output
echo "error:   $error"
echo "status:  $stat"
echo "time:    $runtime"
rm -f "${TMP_FILE}"


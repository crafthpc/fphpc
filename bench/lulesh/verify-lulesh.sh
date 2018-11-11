#!/bin/bash
#
# Verification routine for LULESH benchmark
#
# Usage: ./check.sh path/to/lulesh-exe
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

# extract pass/fail status
if [[ ! -e "${EXE_NAME}" || $exit_code -ne 0 ]]; then
    stat="error"
    error="0.0"
else
    stat="pass"
    iterations=$(grep "Iteration count" "${TMP_FILE}" | awk '{print $4}')
    finalorigin=$(grep "Final Origin Energy" "${TMP_FILE}" | awk '{print $5}')
    maxabsdiff=$(grep "MaxAbsDiff" "${TMP_FILE}"   | awk '{print $3}')
    totabsdiff=$(grep "TotalAbsDiff" "${TMP_FILE}" | awk '{print $3}')
    maxreldiff=$(grep "MaxRelDiff" "${TMP_FILE}"   | awk '{print $3}')
    testmad=$(echo "$maxabsdiff" | awk '{if ($1 < 1e-8) print 1; else print 0}')
    testtad=$(echo "$totabsdiff" | awk '{if ($1 < 1e-8) print 1; else print 0}')
    testmrd=$(echo "$maxreldiff" | awk '{if ($1 < 1e-8) print 1; else print 0}')
    [[ "$iterations" == "932" ]] || stat="fail"
    [[ "$finalorigin" == "2.025075e+05" ]] || stat="fail"
    [[ "$testmad" == "1" ]] || stat="fail"
    [[ "$testtad" == "1" ]] || stat="fail"
    [[ "$testmrd" == "1" ]] || stat="fail"

    # TODO: determine a better aggregate error measure
    error="$maxreldiff"
fi

# output
echo "error:   $error"
echo "status:  $stat"
echo "time:    $runtime"
rm -f "${TMP_FILE}"


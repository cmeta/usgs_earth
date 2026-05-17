#!/bin/bash
# USGS Accessibility Checker
# Check if USGS endpoints are accessible

URLS=(
  "https://dds.cr.usgs.gov"
  "https://www.usgs.gov"
  "https://dds.cr.usgs.gov/download-staging/eyJpZCI6OTc3NTc2NTM1LCJjb250YWN0SWQiOjI2MjM2MjEyfQ=="
)

echo "=== USGS Accessibility Check ==="
echo "Time: $(date)"
echo ""

for url in "${URLS[@]}"; do
  echo -n "Checking: $url ... "

  # Use curl to check HTTP status
  status=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 10 --max-time 30 "$url" 2>/dev/null)

  if [ "$status" = "200" ]; then
    echo "✓ OK (200)"
  elif [ "$status" = "401" ] || [ "$status" = "403" ]; then
    echo "✓ OK (auth required, server responding)"
  elif [ "$status" = "301" ] || [ "$status" = "302" ]; then
    echo "✓ Redirect ($status)"
  else
    echo "✗ FAILED ($status)"
  fi
done

echo ""
echo "=== Done ==="
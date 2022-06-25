#!/usr/bin/env bash

export PROJECT_PATH
PROJECT_PATH="$(pwd)/unity-renderer"

set -e
set -x
mkdir -p /root/.cache/unity3d
mkdir -p /root/.local/share/unity3d/Unity/
set +x

ls -lah /root/.cache/unity3d

echo "UNITY PATH is $UNITY_PATH"

if [ -z "$DEVELOPERS_UNITY_LICENSE_CONTENT_2020_3_BASE64" ]; then
  echo 'DEVELOPERS_UNITY_LICENSE_CONTENT_2020_3_BASE64 not present. License won''t be configured'
else
  LICENSE=$(echo "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48cm9vdD4KICAgIDxMaWNlbnNlIGlkPSJUZXJtcyI+CiAgICAgICAgPE1hY2hpbmVCaW5kaW5ncz4KICAgICAgICAgICAgPEJpbmRpbmcgS2V5PSIxIiBWYWx1ZT0iNTc2NTYyNjI2NTcyMjY0NzYxNjI0YzY1NTI2Zjc1NzgiLz4KICAgICAgICAgICAgPEJpbmRpbmcgS2V5PSIyIiBWYWx1ZT0iNTc2NTYyNjI2NTcyMjY0NzYxNjI0YzY1NTI2Zjc1NzgiLz4KICAgICAgICA8L01hY2hpbmVCaW5kaW5ncz4KICAgICAgICA8TWFjaGluZUlEIFZhbHVlPSJEN25UVW5qTkFtdHNVTWNub3lycWtnSWJZZE09Ii8+CiAgICAgICAgPFNlcmlhbEhhc2ggVmFsdWU9Ijc1MjJlYzVjM2JlZjA4Yjk0ZWYyNWU4MTNjMjBlMjYyYTliZDA1MmYiLz4KICAgICAgICA8RmVhdHVyZXM+CiAgICAgICAgICAgIDxGZWF0dXJlIFZhbHVlPSIzMyIvPgogICAgICAgICAgICA8RmVhdHVyZSBWYWx1ZT0iMSIvPgogICAgICAgICAgICA8RmVhdHVyZSBWYWx1ZT0iMTIiLz4KICAgICAgICAgICAgPEZlYXR1cmUgVmFsdWU9IjIiLz4KICAgICAgICAgICAgPEZlYXR1cmUgVmFsdWU9IjI0Ii8+CiAgICAgICAgICAgIDxGZWF0dXJlIFZhbHVlPSIzIi8+CiAgICAgICAgICAgIDxGZWF0dXJlIFZhbHVlPSIzNiIvPgogICAgICAgICAgICA8RmVhdHVyZSBWYWx1ZT0iMTciLz4KICAgICAgICAgICAgPEZlYXR1cmUgVmFsdWU9IjE5Ii8+CiAgICAgICAgICAgIDxGZWF0dXJlIFZhbHVlPSI2MiIvPgogICAgICAgIDwvRmVhdHVyZXM+CiAgICAgICAgPERldmVsb3BlckRhdGEgVmFsdWU9IkFRQUFBRVkwTFZCUVIwZ3RSMGhRUXkxT1IwZGFMVGcxUVVFdE56SlROQT09Ii8+CiAgICAgICAgPFNlcmlhbE1hc2tlZCBWYWx1ZT0iRjQtUFBHSC1HSFBDLU5HR1otODVBQS1YWFhYIi8+CiAgICAgICAgPFN0YXJ0RGF0ZSBWYWx1ZT0iMjAyMi0wNC0wMlQwMDowMDowMCIvPgogICAgICAgIDxVcGRhdGVEYXRlIFZhbHVlPSIyMDIyLTA2LTI2VDExOjEwOjAxIi8+CiAgICAgICAgPEluaXRpYWxBY3RpdmF0aW9uRGF0ZSBWYWx1ZT0iMjAyMi0wNC0wMlQwMToxNzowOCIvPgogICAgICAgIDxMaWNlbnNlVmVyc2lvbiBWYWx1ZT0iNi54Ii8+CiAgICAgICAgPENsaWVudFByb3ZpZGVkVmVyc2lvbiBWYWx1ZT0iMjAyMC4zLjBmMSIvPgogICAgICAgIDxBbHdheXNPbmxpbmUgVmFsdWU9ImZhbHNlIi8+CiAgICAgICAgPEVudGl0bGVtZW50cz4KICAgICAgICAgICAgPEVudGl0bGVtZW50IE5zPSJ1bml0eV9lZGl0b3IiIFRhZz0iVW5pdHlQZXJzb25hbCIgVHlwZT0iRURJVE9SIiBWYWxpZFRvPSI5OTk5LTEyLTMxVDAwOjAwOjAwIi8+CiAgICAgICAgICAgIDxFbnRpdGxlbWVudCBOcz0idW5pdHlfZWRpdG9yIiBUYWc9IkRhcmtTa2luIiBUeXBlPSJFRElUT1JfRkVBVFVSRSIgVmFsaWRUbz0iOTk5OS0xMi0zMVQwMDowMDowMCIvPgogICAgICAgIDwvRW50aXRsZW1lbnRzPgogICAgPC9MaWNlbnNlPgo8U2lnbmF0dXJlIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjIj48U2lnbmVkSW5mbz48Q2Fub25pY2FsaXphdGlvbk1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnL1RSLzIwMDEvUkVDLXhtbC1jMTRuLTIwMDEwMzE1I1dpdGhDb21tZW50cyIvPjxTaWduYXR1cmVNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjcnNhLXNoYTEiLz48UmVmZXJlbmNlIFVSST0iI1Rlcm1zIj48VHJhbnNmb3Jtcz48VHJhbnNmb3JtIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnI2VudmVsb3BlZC1zaWduYXR1cmUiLz48L1RyYW5zZm9ybXM+PERpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvMDkveG1sZHNpZyNzaGExIi8+PERpZ2VzdFZhbHVlPlB6YjVYOWNveGtXeGRVd0lKY0VmbWpTNHppYz08L0RpZ2VzdFZhbHVlPjwvUmVmZXJlbmNlPjwvU2lnbmVkSW5mbz48U2lnbmF0dXJlVmFsdWU+aW0rQWVXZWpXTWF2dnZqYkdxTmpvSytSZEI0bTY2Z1NHcEJpbmp5MlFrNEZRU2ZNdmRzWUVLZGR1TEM0M2QyVms5a1kxcXJlN3BJVCYjMTM7CkEwQktGOURGbDh2Rm8rUmdhL3dPRmtVem1ZM1VLa1A2OVM0a2VsT0NnTlprd2hXY091cERCVkZHVm8wZWRrUTgxaFBadXFrWmVta2YmIzEzOwpuc2ZjdTFTeVc2S2xyV2drR1NkSEYzcmNURnZrRFljR3pMeURpQUkxaEF3QlJCbHZEcm0vNXlDclZNTkpPdFovQnN3aDhuVzQ1K0dpJiMxMzsKb3l6OEpwTk9BMmxpY1QwZVorcklkM29hM0poZzBTUEtGV2lXMmR4Q0hiUzNkMmNEVmxza0dUQ2lGYVVMdEVKRG9yOWdGQkNaVnFHcyYjMTM7Cm9UV0xWY1ozZGhSYWtTTmlidzZQUE1rbHdHRFRaM1dSVjNvb2JnPT08L1NpZ25hdHVyZVZhbHVlPjwvU2lnbmF0dXJlPjwvcm9vdD4=" | base64 -di | tr -d '\r')

  echo "Writing LICENSE to license file /root/.local/share/unity3d/Unity/Unity_lic.ulf"
  echo "$LICENSE" > /root/.local/share/unity3d/Unity/Unity_lic.ulf
fi

set -x

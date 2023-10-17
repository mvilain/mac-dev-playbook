#!/usr/bin/env bash
# update Safari and Brave bookmarks files from file

SCRIPT=$(basename "$0")
hosts="studio dexlabs dede"
SAFARI_DIR='~/Library/Safari/'
OPT_S=~/Desktop/Bookmarks.plist
BRAVE_DIR='~/Library/ApplicationSupport/BraveSoftware/Brave-Browser/Default/'
OPT_B=~/Desktop/Bookmarks

usage () {
    cat <<-USAGE

    ${SCRIPT} -h -b <BRAVE_FILE> -s <SAFARI_FILE>

    copy file to browser's bookmarks (format different for each browser)

    OPTIONS
    -s FILE    copy FILE to Safari Bookmarks.plist [default: ${OPT_S}]
    -b FILE    copy FILE to Brave Bookmarks [default: ${OPT_B}]
    -h         display this help text and exit

USAGE
}

while getopts ":hb:s:" OPT; do
  case $OPT in
  h)
    usage
    exit
    ;;
  b)
    OPT_B=${OPTARG}
    ;;
  s)
    OPT_S=${OPTARG}
    ;;
  *)
    usage
    exit
    ;;    # default
  esac
done

shift $((OPTIND-1))
# $@ should be blank...it is ignored

if [[ -z "${OPT_B}" || -z "${OPT_S}" ]]; then
  usage
  exit 2
fi

if [ -e "${OPT_B}" ]; then
  for h in ${hosts}; do
    printf "%s...\n" $h
    scp ${OPT_B} ${h}:${BRAVE_DIR}
  done
fi
if [ -e "${OPT_S}" ]; then
  for h in ${hosts}; do
    printf "%s...\n" $h
    scp ${OPT_S} ${h}:${SAFARI_DIR}
  done
fi

exit

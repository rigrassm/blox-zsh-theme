# ---------------------------------------------
# CWD block configurations

BLOX_BLOCK__CWD_COLOR="${BLOX_BLOCK__CWD_COLOR:-blue}"
BLOX_BLOCK__CWD_TRUNC="${BLOX_BLOCK__CWD_TRUNC:-3}"

# ---------------------------------------------

function blox_block__cwd() {
  local result=""
  local cwd="%($(( $BLOX_BLOCK__CWD_TRUNC + 1 ))~|.../%$BLOX_BLOCK__CWD_TRUNC~|%~)"
  result="$( blox_helper__color_string ${BLOX_BLOCK__CWD_COLOR} ${cwd} )"

  echo ${result}
}

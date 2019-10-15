# ---------------------------------------------
# Symbol block configurations

# Colors
BLOX_BLOCK__SYMBOL_COLOR="${BLOX_BLOCK__SYMBOL_COLOR:-cyan}"
BLOX_BLOCK__SYMBOL_EXIT_COLOR="${BLOX_BLOCK__SYMBOL_EXIT_COLOR:-red}"

# Symbols
BLOX_BLOCK__SYMBOL_SYMBOL="${BLOX_BLOCK__SYMBOL_SYMBOL:-❯}"
BLOX_BLOCK__SYMBOL_EXIT_SYMBOL="${BLOX_BLOCK__SYMBOL_EXIT_SYMBOL:-$BLOX_BLOCK__SYMBOL_SYMBOL}"
BLOX_BLOCK__SYMBOL_ALTERNATE="${BLOX_BLOCK__SYMBOL_ALTERNATE:-◇}"

# ---------------------------------------------

function blox_block__symbol() {
  local result=""
  local good_exit="$( blox_helper__color_string ${BLOX_BLOCK__SYMBOL_COLOR} ${BLOX_BLOCK__SYMBOL_SYMBOL} )"
  local bad_exit="$( blox_helper__color_string ${BLOX_BLOCK__SYMBOL_EXIT_COLOR} ${BLOX_BLOCK__SYMBOL_EXIT_SYMBOL} )"

  result="%(?.${good_exit}.${bad_exit})"

  echo ${result}
}

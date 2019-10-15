# ---------------------------------------------
# Utilities functions

# Check if command exists
function blox_helper__exists() {
  command -v "$1" &> /dev/null
}

# Simple function to produce a colorized string
function blox_helper__color_string() {
  local -r color="$1"
  local -r contents="$2"

  local colorized="%F{${color}}${contents}%{${reset_color}%}";
  
  echo -n "${colorized}";

}

# Function to "box up" a string using the specified prefix/suffix and their set color
function blox_helper__wrap_block_content() {
  local -r contents="$1"

  local -r prefix="$( blox_helper__color_string ${BLOX_CONF__SURROUND_COLOR} ${BLOX_CONF__BLOCK_PREFIX} )"
  local -r suffix="$( blox_helper__color_string ${BLOX_CONF__SURROUND_COLOR} ${BLOX_CONF__BLOCK_SUFFIX} )"

  local -r result="${prefix} ${contents} ${suffix}";

  echo -n "$result"
}

# Use this when you just need to build a block with a single color for the blocks contents
function blox_helper__build_block_color() {
  local -r color="$1"
  local -r contents="$2"
  local colorized="$( blox_helper__color_string ${color} ${contents} )";
  local result="$( blox_helper__wrap_block_content ${colorized} )";
  echo -n "${result}"
}

# Use this function when your block will handle the color coding itself and
# only needs to have the contents wrapped up.
function blox_helper__build_block_nocolor() {
  local -r contents="$1"

  local -r result="$( blox_helper__wrap_block_content ${contents} )";

  echo -n "$result"
}

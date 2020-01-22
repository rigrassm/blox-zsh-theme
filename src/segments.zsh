# ---------------------------------------------
# Configurations

# Defualts
__BLOX_SEG_DEFAULT__UPPER_LEFT=( host cwd git exec_time )
__BLOX_SEG_DEFAULT__UPPER_RIGHT=( bgjobs nodejs pyenv virtualenv time )
__BLOX_SEG_DEFAULT__LOWER_LEFT=( symbol )
__BLOX_SEG_DEFAULT__LOWER_RIGHT=( )

# Upper
BLOX_SEG__UPPER_LEFT=${BLOX_SEG__UPPER_LEFT:-$__BLOX_SEG_DEFAULT__UPPER_LEFT}
BLOX_SEG__UPPER_RIGHT=${BLOX_SEG__UPPER_RIGHT:-$__BLOX_SEG_DEFAULT__UPPER_RIGHT}

# Lower
BLOX_SEG__LOWER_LEFT=${BLOX_SEG__LOWER_LEFT:-$__BLOX_SEG_DEFAULT__LOWER_LEFT}
BLOX_SEG__LOWER_RIGHT=${BLOX_SEG__LOWER_RIGHT:-$__BLOX_SEG_DEFAULT__LOWER_RIGHT}

BLOX_BLOCK__BLOCK_NO_SEPARATOR=()
BLOX_BLOCK__SYMBOL_SEPARATOR="${BLOX_BLOCK__SYMBOL_SEPARATOR:-$BLOX_CONF__BLOCK_SEPARATOR}"

# ---------------------------------------------
# Helper functions

# Render a block
function blox_helper__render_block() {
  local block=$1
  local block_func="blox_block__${block}"

  if command -v "$block_func" &> /dev/null; then
    print_content "$(${block_func})"
  else
    # Support for older versions of blox, where the block render function name
    # would be the same as the block name itself.
    print_content $(${block})
  fi
}

# Build a given segment
function blox_helper__render_segment() {

  # For some reason, arrays cannot be assigned in typeset expressions in older versions of zsh.
  local blocks=(); 
  blocks+=( `echo -n $@` )
  local segment=""

  for block in ${blocks[@]}; do
      contents="$(blox_helper__render_block ${block})"
      if [[ ${block} == "symbol" ]]; then
	  # Check if our symbol is the only thing rendered and if so, don't use the separator
          if [[ ${segment} == "" ]]; then
              segment+="${contents}"
          else
	      segment+="${BLOX_BLOCK__SYMBOL_SEPARATOR}${contents}"
          fi
      elif [[ ${BLOX_BLOCK__BLOCK_NO_BLOCK_SEPARATOR[(ie)$block]} -le ${#BLOX_BLOCK__BLOCK_NO_BLOCK_SEPARATOR} ]]; then
          segment+="${contents}"
      else 
	  segment+="${BLOX_CONF__BLOCK_SEPARATOR}${contents}"
      fi
  done

  print_content $segment
}

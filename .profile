########################################################
# Display message when debugging startup scripts, if
#   the debug variable is set (in .bash_profile)
########################################################
if [[ ! -z "${STARTUP_DEBUG}" ]]; then
  echo "I am dot-profile"
fi


# =================================================================
# PURPOSE
# =================================================================
# ..
# ---

INFILE=$1
OUTFILE=$2

transform_url() {
  LINE=$(echo "$1")
  RE_TITLE_LINE="^//.*"
  RE_URL_LINE="^http.+$"
  RE_EMPTY_LINE="^$"

  # if this is a line with URL - get the HTTP code and redirect URL
  if [[ $LINE =~ $RE_URL_LINE ]]; then
    # --- cURL options ---------------
    # -L            : redirect on 301 code
    # -m            : max-timeout set to 3 seconds
    # -s            : silent mode
    # -o /dev/null  : write to STDOUT
    RESULT=$(curl $LINE \
      -L \
      -m 3 \
      --write-out "%{http_code} ; %{url_effective}" \
      -s \
      -o /dev/null )

    echo "$LINE ; $RESULT"
  fi

  # if this is an empty line - return an EMPTY line-string
  if [[ $LINE =~ $RE_EMPTY_LINE ]]; then
    echo ""
  fi

  # if this is a TITLE line, return the entire line prepended w/'TITLE'
  if [[ $LINE =~ $RE_TITLE_LINE ]]; then
    echo "TITLE: $LINE"
  fi
}

cat $INFILE | while read line; do transform_url $line; done

# =================================================================
# REFERENCES
# =================================================================
# ---
# * [pup - CLI html parser and utility](https://github.com/ericchiang/pup)
# * [cURL redirects - howto handle](https://davidwalsh.name/curl-follow-redirects)
# * [get HTTP_CODE and URL after cURL is redirected](https://stackoverflow.com/questions/3074288/get-url-after-curl-is-redirected)
# * [set multipl 'write-out' variables in a single cURL call](https://stackoverflow.com/questions/35519484/can-you-set-multiple-curl-write-out-variables-to-bash-variables-in-a-single-ca)
# * ..
#



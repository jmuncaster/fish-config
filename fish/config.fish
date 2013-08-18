

# http://ridiculousfish.com/shell/user_doc/html/index.html#initialization
if status --is-login
  set -x PATH $HOME/bin /usr/local/bin $PATH
  remote_dups PATH
end

# See http://stackoverflow.com/questions/3146274/
#  is-it-ok-to-use-dyld-library-path-on-mac-os-x-and-whats-the-dynamic-library-s
# for explanation of DYLD_FALLBACK_LIBRARY_PATH

# Now I think this should be commented out.
# https://github.com/mxcl/homebrew/issues/18990
#set -x DYLD_FALLBACK_LIBRARY_PATH $DYLD_FALLBACK_LIBRARY_PATH /usr/local/lib
#set -x DYLD_FALLBACK_LIBRARY_PATH $DYLD_FALLBACK_LIBRARY_PATH /Applications/VLC.app/Contents/MacOS/lib/

set -x EDITOR vim

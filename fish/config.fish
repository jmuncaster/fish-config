

# http://ridiculousfish.com/shell/user_doc/html/index.html#initialization
if status --is-login
  # On OS-X, /etc/paths and /etc/paths.d/* are loaded by default. The fish
  # shell does not do this. Here we call custom functions that load the
  # system default and prepend user paths.
  init_osx_path /usr/local/bin
end


# See http://stackoverflow.com/questions/3146274/
#  is-it-ok-to-use-dyld-library-path-on-mac-os-x-and-whats-the-dynamic-library-s
# for explanation of DYLD_FALLBACK_LIBRARY_PATH

# Now I think this should be commented out.
# https://github.com/mxcl/homebrew/issues/18990
#set -x DYLD_FALLBACK_LIBRARY_PATH $DYLD_FALLBACK_LIBRARY_PATH /usr/local/lib
#set -x DYLD_FALLBACK_LIBRARY_PATH $DYLD_FALLBACK_LIBRARY_PATH /Applications/VLC.app/Contents/MacOS/lib/


# Set vim as default editor
set -x EDITOR vim

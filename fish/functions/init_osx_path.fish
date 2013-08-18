#
# by c4
#
# This is a modified copy of the system-wide config.fish (share/config.fish),
# which messes up the sort order of PATH/MANPATH variables and fails to catch
# OSX-specific paths that are loaded in other shells by path_helper. This file
# is the user's personal config file, loaded last by fish, which gathers the
# missing paths and sets them in the user-defined order.
#
# For inclusion in trunk, needs a switch to ignore for !OSX
#

#
# this is the OSX path helper, it doesn't work in fish
#
# bash -c "/usr/libexec/path_helper -s"
#

function init_osx_path -d 'Update PATH by prepending $argv and appending
  system paths'

  # USER: set important paths here to put at the
  # front of $PATH if you want to override system-wide settings
  set --local user_paths $argv

  # Populate a local variable with directories from /etc/paths
  set --local etc_paths
  if test -f /etc/paths
    for dir in (cat /etc/paths)
      if test -d $dir
        set etc_paths $etc_paths $dir
      end
    end
  end

  # Populate a local variable with content of each file
  # in /etc/paths.d/* (filesort order)
  set --local etc_pathsd
  if test -d /etc/paths.d
    for file in /etc/paths.d/*
      if test -d (cat $file)
        set etc_pathsd $etc_pathsd (cat $file)
      end
    end
  end

  # Collect paths (more important ones in front)
  set --local path_list $user_paths $PATH $etc_paths $etc_pathsd

  # Remove duplicates from the list
  set --local path_sorted
  for i in $path_list
    if not contains $i $path_sorted
      set path_sorted $path_sorted $i
    end
  end

  # Finally, set the PATH variable
  set -x PATH $path_sorted
end


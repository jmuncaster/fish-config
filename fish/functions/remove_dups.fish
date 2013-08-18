function remove_dups --description 'Remove duplicates from environment variable'
  if test (count $argv) = 1
    set -l newvar
    set -l count 0

    for v in $$argv
      if contains -- $v $newvar
        set count (expr $count + 1)
      else
        set newvar $newvar $v
      end
    end

    set $argv $newvar

    test $count -gt 0
    and echo Removed $count duplicates from $argv
  else
    for a in $argv
      remove_dups $a
    end
  end
end


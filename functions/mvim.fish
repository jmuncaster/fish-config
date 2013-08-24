function mvim
  if test (count $argv) -eq 0
    open -a /usr/local/Cellar/macvim/7.3-66/MacVim.app/
  else
    command mvim --remote-tab-silent $argv
  end
end

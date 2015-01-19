" =================
" OS X GUI Settings
" =================

if has("gui_running") && has("gui_macvim")

  " Use vim-fontdetect to select preferred font
  if fontdetect#hasFontFamily("Source Code Pro")
    let &guifont = "Source Code Pro Light:h14"
  elseif fontdetect#hasFontFamily("Inconsolata")
    let &guifont="Inconsolata:h14"
  elseif fontdetect#hasFontFamily("Menlo")
    let &guifont = "Menlo:h14"
  endif

  set fuopt=maxhorz,maxvert
  set guioptions-=T " Hide MacVim toolbar
end

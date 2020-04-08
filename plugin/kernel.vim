function! s:TurnKernelModeOn()
    let g:kernel_mode=1
    if exists("b:kernel_mode_loaded")
        unlet b:kernel_mode_loaded
    endif

    if g:ale_enabled
        let g:ale_c_gcc_options = "-I./include/"
        call ale#toggle#Disable()
        call ale#toggle#Enable()
    endif
    syntax off
    syntax on
endfunction

function! s:TurnKernelModeOff()
    let g:kernel_mode=0
    syntax off
    syntax on
endfunction

function! s:ToggleKernelMode()
    if exists("g:kernel_mode") && g:kernel_mode
        call s:TurnKernelModeOff()
    else
        call s:TurnKernelModeOn()
    endif
endfunction

command! KernelModeOn call s:TurnKernelModeOn()
command! KernelModeOff call s:TurnKernelModeOff()
command! KernelModeToggle call s:ToggleKernelMode()

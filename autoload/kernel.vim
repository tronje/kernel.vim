function! kernel.vim#LoadKernelConf()
    " turn off Syntastic
    " TODO possibly make Syntastic work with Kernel stuff
    "      e.g. with this: https://github.com/vladimiroltean/blog/wiki
    :SyntasticToggleMode

    " unsigned integers
    syn keyword Type u8 u16 u32 u64

    " signed integers
    syn keyword Type s8 s16 s32 s64

    " debug levels
    syn keyword Constant KERN_EMERG KERN_ALERT KERN_CRIT KERN_ERR KERN_WARNING
    syn keyword Constant KERN_NOTICE KERN_INFO KERN_DEBUG KERN_DEFAULT KERN_CONT

    " kernel functions
    syn keyword Function printk
endfunction

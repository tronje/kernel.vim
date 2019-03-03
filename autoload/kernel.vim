function! kernel#LoadKernelConf()
    " unsigned integers
    syn keyword Type u8 u16 u32 u64

    " signed integers
    syn keyword Type s8 s16 s32 s64

    " debug levels
    syn keyword Constant KERN_EMERG KERN_ALERT KERN_CRIT KERN_ERR KERN_WARNING
    syn keyword Constant KERN_NOTICE KERN_INFO KERN_DEBUG

    " kernel functions
    syn keyword Function printk

    " pr_debug, etc.
    syn keyword Function pr_emerg pr_alert pr_crit pr_err pr_warning pr_notice
    syn keyword Function pr_info pr_debug

    " dev_dbg, etc.
    syn keyword Function dev_emerg dev_alert dev_crit dev_err dev_warn
    syn keyword Function dev_notice dev_info dev_dbg

    " alloc functions
    " this matches any lower case char followed by 'alloc' for now.
    syn match Function "\l*alloc"
endfunction

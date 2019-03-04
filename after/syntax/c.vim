if !exists("g:kernel_mode") || !g:kernel_mode || exists("b:kernel_mode_loaded")
    finish
endif

" custom kernel types {{{

" unsigned integers
syn keyword Type u8 u16 u32 u64

" signed integers
syn keyword Type s8 s16 s32 s64

" }}}

" macros and functions {{{

" debug levels
syn keyword Constant KERN_EMERG KERN_ALERT KERN_CRIT KERN_ERR KERN_WARNING
syn keyword Constant KERN_NOTICE KERN_INFO KERN_DEBUG

" kernel functions
syn keyword Function printk

" pr_debug, etc.
syn keyword Function pr_emerg pr_alert pr_crit pr_err pr_warning pr_warn
syn keyword Function pr_notice pr_info pr_debug

" dev_dbg, etc.
syn keyword Function dev_emerg dev_alert dev_crit dev_err dev_warn
syn keyword Function dev_notice dev_info dev_dbg

" alloc functions
" this matches any lower case char followed by 'alloc' for now.
syn match Function "\l*alloc"

" }}}

" format specifiers {{{
" see: https://www.kernel.org/doc/html/latest/core-api/printk-formats.html

" pointer types
syn match cFormat "%p[sSfFBKxrR]"
syn match cFormat "%pSR"
syn match cFormat "%pa[dp]"

" raw buffer as an escaped string
" TODO look-behind matching so we can allow switching around the individual
" chars, but not allow multiple of the same
syn match cFormat "%\*pEa\?c\?h\?n\?o\?p\?s\?"
syn match cFormat "%\d\+pEa\?c\?h\?n\?o\?p\?s\?"

" raw buffer as hex string
syn match cFormat "%\*ph[CDN]"
syn match cFormat "%\d\+ph[CDN]"

" MAC/FDDI addresses
syn match cFormat "%pM[RF]\?"
syn match cFormat "%pmR\?"

" IPv4 addresses
syn match cFormat "%p[iI]4[hnbl]\?"

" IPv6 addresses
syn match cFormat "%pi6"
syn match cFormat "%pI6c\="

" IPv4/IPv6 addresses (generic, with port, flowinfo, scope)
" TODO look-behind (see above)
syn match cFormat "%p[Ii]Sp\?f\?s\?c\?h\?n\?b\?l\?"

" UUID/GUID addresses
syn match cFormat "%pU[bBlL]\?"

" dentry names
syn match cFormat "%p[dD][234]\?"

" block_device names
syn match cFormat "%pg"

" struct va_format
syn match cFormat "%pV"

" device tree nodes
" TODO look-behind (see above)
syn match cFormat "%p0Ff\?n\?p\?P\?c\?C\?F\?"

" time and date (struct rtc_time)
syn match cFormat "%ptR[dt]\?r\?"

" struct clk
syn match cFormat "%pCn\?"

" bitmap and derivates such as cpumask and nodemask
syn match cFormat "%\*pbl\?"
syn match cFormat "%\d\+pbl\?"

" flags bitfields such as page flags, gfp_flags
syn match cFormat "%pG[pgv]"

" network device features
syn match cFormat "%pNF"

" }}}

let b:kernel_mode_loaded = "true"

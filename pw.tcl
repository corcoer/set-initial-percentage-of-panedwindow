# panedwindow demo

destroy .t
toplevel .t

set pw [ttk::panedwindow .t.pw -orient horizontal] 
pack ${pw} -expand true -fill both

# lef
set pw_lf [frame ${pw}.lf]
pack ${pw_lf} -expand true -fill both

set lf_wt [text ${pw_lf}.tx]
pack ${lf_wt} -expand true -fill both

# right 
set pw_rf [frame ${pw}.rf]
pack ${pw_rf} -expand true -fill both

set rf_wt [text ${pw_rf}.tx]
pack ${rf_wt} -expand true -fill both

${pw} add ${pw_lf}
${pw} add ${pw_rf}

# set percentage
set percentage 0.2
bind ${pw} <Map> "sash_pos ${pw} ${percentage}"

proc sash_pos { pw pt } {

    set ww [winfo width ${pw}]
    set new_pos [expr int(${ww} * ${pt})]
    
    if { ${new_pos} < 1 } {
      set new_pos 1
    }
    
    ${pw} sashpos 0 ${new_pos}
    
    # unbind Map
    bind ${pw} <Map> break
}

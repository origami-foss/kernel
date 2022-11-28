boot = get_option('boot')

if boot == 'bios'
        asm_src += files('boot/bootstrap.asm',
		'boot/header.asm'
	)
elif boot == 'uefi'
        error('uefi not yet implemented')
else
        error('invalid boot option: ' + boot)
endif

project('paper', 'cpp',
	license : 'MIT',
	default_options : [
		'cpp_std=c++17',
		'werror=true'
	]
)

nasm = find_program('nasm', required : true)

c_src = []
#c_inc = []
asm_src = []

subdir('source')
#subdir('include')

assembler = generator(nasm,
	output : '@BASENAME@.o',
	arguments : [
		'-i', meson.current_source_dir() + '/',
		'-i', join_paths(meson.current_source_dir(), ''),
		'@INPUT@',
		'-o', '@OUTPUT@'
	] + meson.get_external_property('asm_flags')
)

executable('paper', [ c_src, assembler.process(asm_src) ],
	link_args : [ '-Wl,-T,' + meson.current_source_dir() / 'linker.ld' ],
	link_depends : [ 'linker.ld' ],
	include_directories : [ 'include' ]
)

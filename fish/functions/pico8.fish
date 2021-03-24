function pico8 --wraps pico8 --description 'Runs pico8 specifying the home directory'
	command pico8 -home ~/.local/share/lexaloffle $argv
end

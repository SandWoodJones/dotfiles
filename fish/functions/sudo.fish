function sudo --wraps sudo --description 'Runs sudo and saves the current time'
	command sudo $argv
	set -g sudoed_utime (date '+%s')
end

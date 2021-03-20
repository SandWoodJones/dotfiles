function wget --wraps wget --description 'Runs wget specifying the .wget-hsts directory'
	command wget --hsts-file=$XDG_CACHE_HOME/wget-hsts $argv
end

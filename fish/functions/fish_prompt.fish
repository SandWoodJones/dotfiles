function fish_prompt
	set -l pstatus $status
	set -l arrow_char

	if status --is-login # fixes missing characters on login shells
		set arrow_char ">"
	else if status --is-interactive
		set arrow_char ""
	end

	set_color brblue
	echo -n	"╔╾╸"
	set_color -o brpurple
	echo -n (prompt_pwd)
	set_color brblue
	echo -n "╺╼═"
	
	# draw horizontal bar
	set -l pwd_len (string length (prompt_pwd))
	set -l pwd_col_even (math "($pwd_len % 2) + (($COLUMNS % 2) * 2)")
	echo -n (string repeat -n (math "floor(($COLUMNS - (7 + $pwd_len)) / 2)") "━═")
	
	if test $pwd_col_even -eq 1 -o $pwd_col_even -eq 2
		echo "┓"
	else
		echo "━╗"
	end

	echo -n "┗═╾╸"
	
	# draws the "last command's exit status" arrow
	if test $pstatus -eq 0
		set_color -o green
	else
		set_color -o red
	end
	echo -n "$arrow_char"
	
	# draws the "sudo status" arrow
	if set -q sudoed_utime # checks if sudoed_utime is set
		set -l remaining_time (math (date '+%s') - $sudoed_utime) 
		if test $remaining_time -le (math 5 \* 60)
			set_color -o brwhite
		else if test $remaining_time -le (math 10 \* 60)
			set_color -o bryellow
		else if test $remaining_time -le (math 15 \* 60)
			set_color -o yellow
		else
			set_color -o brblack
		end
	else
		set_color -o brblack
	end
	echo -n $arrow_char

	set_color -o brcyan
	echo -n $arrow_char

	set_color normal
	echo " "
end

function fish_right_prompt
	set -l pwd_len (string length (prompt_pwd))
	set -l pwd_col_even (math "($pwd_len % 2) + (($COLUMNS % 2) * 2)")
	set_color brblue

	if test $pwd_col_even -eq 0 -o $pwd_col_even -eq 3
		echo "╠┛"
	else
		echo "┣╝"
	end
end

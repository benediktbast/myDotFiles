#! /bin/zsh
function listTermColors { 
	for code ({000..255}) { 
		print -nP -- "$code: %F{$code}%K{$code}Test%k%f " ; (( code % 8 && code < 255 )) || printf '\n' 
	}
}

print "Color Tester"
listTermColors

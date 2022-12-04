io.DAY: 3
\l /advent/src/lib/io

letter_value:{[letter]
  intval: _ic letter

  :intval - :[intval < 91;38;96]
}

compare_rs:{[sone;stwo]
  ret: &|/'sone ~\:/: stwo
  :ret
}

val_rs:{[rs]
  cutrs: (0,((#rs)%2)) _ rs
  :letter_value @ cutrs[1] @ *compare_rs . cutrs
}

one_ans: +/val_rs' io.input

val_badge:{[sacks]
  :letter_value @ sacks[2] @ *compare_rs . (,sacks[1] @ compare_rs . 2 # sacks) , ,sacks[2]
}

two_ans: +/val_badge' (((#io.input)%3) , 3) # io.input

io.answer[one_ans;two_ans]

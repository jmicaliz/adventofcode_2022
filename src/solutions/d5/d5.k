/ Copy this template for the header and footer of the solution

io.DAY: 5 / Replace this with numeral of day
\l /advent/src/lib/io
\l /advent/src/lib/core

/ [P]     [L]         [T]            
/ [L]     [M] [G]     [G]     [S]    
/ [M]     [Q] [W]     [H] [R] [G]    
/ [N]     [F] [M]     [D] [V] [R] [N]
/ [W]     [G] [Q] [P] [J] [F] [M] [C]
/ [V] [H] [B] [F] [H] [M] [B] [H] [B]
/ [B] [Q] [D] [T] [T] [B] [N] [L] [D]
/ [H] [M] [N] [Z] [M] [C] [M] [P] [P]
/  1   2   3   4   5   6   7   8   9 

stacks: ("PLMNWVBH";"HQM";"LMQFGBDN";"GWMQFTZ";"PHTM";"TGHDJMBC";"RVFBNM";"SGRMHLP";"NCBDP")

parse_inst:{[inst]
  pinst: (0$core.split[inst;" "] @ 1 3 5)
  :(pinst[0];pinst[1]-1;pinst[2]-1)
}

reorder:{[inst]
  pinst: parse_inst[inst]
  stacks[pinst[2]]: (|(pinst[0] # stacks[pinst[1]])) , stacks[pinst[2]]
  stacks[pinst[1]]: pinst[0] _ stacks[pinst[1]]
}

reorder_two:{[inst]
  pinst: parse_inst[inst]
  stacks[pinst[2]]: (pinst[0] # stacks[pinst[1]]) , stacks[pinst[2]]
  stacks[pinst[1]]: pinst[0] _ stacks[pinst[1]]
}

reorder' io.input

one_ans: ,/1 #' stacks

/ stacks: ("NZ";"DCM";"P")
stacks: ("PLMNWVBH";"HQM";"LMQFGBDN";"GWMQFTZ";"PHTM";"TGHDJMBC";"RVFBNM";"SGRMHLP";"NCBDP")

reorder_two' io.input

two_ans: 0N

io.answer[one_ans;two_ans]

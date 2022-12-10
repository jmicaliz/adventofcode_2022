/ Copy this template for the header and footer of the solution

io.DAY: 8 / Replace this with numeral of day
\l /advent/src/lib/io

input: io.gi[0]
  
/ Integer input
ii: 0$''input
tot_row: #ii
tot_col: #*ii

vischeck:{[ind]
    left: ii[ind[0];!ind[1]]
    top: ii[;ind[1]][!ind[0]]
    right: ii[ind[0];(1 + ind[1]) _ !tot_row]
    bottom: ii[;ind[1]][(1 + ind[0]) _ !tot_row]

    :(|/&/'(ii . ind) > (left;top;right;bottom))
}


indlist: ,/(1 _ -1 _ !tot_row) ,/:\: (1 _ -1 _ !tot_col)
outer: ((#input) * 4) - 4
inner: +/vischeck' indlist

one_ans: outer + inner

score:{[ind]
    left: ii[ind[0];!ind[1]]
    top: ii[;ind[1]][!ind[0]]
    right: ii[ind[0];(1 + ind[1]) _ !tot_row]
    bottom: ii[;ind[1]][(1 + ind[0]) _ !tot_row]

    val: ii . ind

    ls: :[|/0=res: &\val > |left;1++/res;+/res]
    ts: :[|/0=res: &\val > |top;1++/res;+/res]
    rs: :[|/0=res: &\val > right;1++/res;+/res]
    bs: :[|/0=res: &\val > bottom;1++/res;+/res]

    :ls * ts * rs * bs
}

two_ans: |/score' indlist

io.answer[one_ans;two_ans]

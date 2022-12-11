/ Copy this template for the header and footer of the solution

io.DAY: 9 / Replace this with numeral of day
\l /advent/src/lib/io
\l /advent/src/lib/core

/ 1 is test, 0 is real
io.DEBUG: 1
input: io.gi[1]

head: ,(0 0)
tail: ,(0 0)

/ ten knots
tk: ,:'10 # ,(0 0)

/ Parse Input
pin:{[line]
    ls: core.split[line;" "]
    :(*ls[0];0$ls[1])
}

move:{[axis;pos]
    ch: head[0]
    ct: tail[0]

    ch[axis]: ch[axis] + pos
    if[|/1< _abs ch - ct
        ct: ch
        ct[axis]: ct[axis] - pos
        tail:: (,ct) , tail
    ]
    head:: (,ch) , head
}

/ move more
/ stuck here, part two something with moving the new head or tail
mm:{[axis;pos]
    ch: tk[0;0]
    ct: tk[1;0]

    ch[axis]: ch[axis] + pos
    tk[0]:: (,ch) , tk[0]
    tkind: 1
    while[(|/1< _abs ch - ct) & tkind < 10
        ct: ch
        ct[axis]: ct[axis] - pos
        tk[tkind]:: (,ct) , tk[tkind]

        tkind+:1
        if[tkind < 10
            ch: ct
            ct: tk[tkind][0]
        ]
    ]
}

/ Do whole move
dirmove:{[dir]
    :["R"~*dir
        move[0;]' (dir[1] # 1)
      "L"~*dir
        move[0;]' (dir[1] # -1)
      "U"~*dir
        move[1;]' (dir[1] # 1)
        move[1;]' (dir[1] # -1)]
}

dirmm:{[dir]
    :["R"~*dir
        mm[0;]' (dir[1] # 1)
      "L"~*dir
        mm[0;]' (dir[1] # -1)
      "U"~*dir
        mm[1;]' (dir[1] # 1)
        mm[1;]' (dir[1] # -1)]
}

parsed: pin' input
dirmove' parsed

one_ans: #?tail

dirmm' parsed
two_ans: #?tk[9]

io.answer[one_ans;two_ans]

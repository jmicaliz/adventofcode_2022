/ Copy this template for the header and footer of the solution

io.DAY: 7 / Replace this with numeral of day
\l /advent/src/lib/io
\l /advent/src/lib/core

test: 0: "/advent/src/solutions/" , io.DDAY , "/" , io.DDAY , "_test_input"

curr_dir: _n
ds: .()

do_cd:{[dir]
  curr_dir:: :[dir ~ ".."
                ,/(-1 _ core.split[-1 _ curr_dir;"/"]) ,\: "/"
              dir ~ ,"/"
                ,"/"
              curr_dir , dir , "/"]
}

get_size:{[cont]
  if[~|/("$ ls";"dir ")~\:4 # cont
    size: 0$*core.split[cont;" "]
    ds_path: (`"/" , `$(core.split[curr_dir;"/"]) _dv "") , `"_"
    .[`ds;ds_path;,;size]
    sum_ind: (-1 _ ds_path) , `SUM
    .[`ds;sum_ind;:;:[_n~ds . sum_ind;size;(ds . sum_ind)+size]]

  ]
}

parse_com:{[com]
  :["$ cd"~4#com;do_cd[5 _ com];get_size[com]]
}

recurse_size:{[dic]
  if[(0#`) ~ (!dic) _dvl `SUM `_
    dic[`SUM]: dic[`SUM] + _f' dic @' (!dic) _dvl `SUM `_
  ]
  :dic
}

/  if[~5~4: dic
/    dic[`SUM]: +/_f' dic @' !dic
/    :dic
/  ]/
/
/  if[~5~4: dic
/    ret: +/(dic) _dv _n
/    :ret
/  ]
/}

/ Testing cd commands
/ parse_com' ("$ cd /";"$ cd a";"$ cd ..";"$ cd foo";"$ cd bar";"$ cd baz";"$ cd ..";"$ cd /")

parse_com' test

foo: recurse_size[ds[`"/"]]

one_ans: 0N
two_ans: 0N

io.answer[one_ans;two_ans]

/ blah
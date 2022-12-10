/ Copy this template for the header and footer of the solution

io.DAY: 7 / Replace this with numeral of day
\l /advent/src/lib/io
\l /advent/src/lib/core

test: 0: "/advent/src/solutions/" , io.DDAY , "/" , io.DDAY , "_test_input"

curr_dir: 0#`
ds: ()

dir_obj:{[name]
  :(.((`name;name)
    (`path;curr_dir)
    (`dirs;())
    (`size;0)))
}

do_cd:{[dir]
  curr_dir:: :[dir ~ ".."
                -1 _ curr_dir
              dir ~ ,"/"
                ,`"/"
              curr_dir , `$dir]
}

do_ls:{[lsout]
  if["$ ls"~lsout
    ds:: ds , dir_obj[*-1 # curr_dir]
    :_n
  ]

  if["dir "~4 # lsout
    ind:*&ds[;`path] ~\: curr_dir
    ds[ind;`dirs]:: (ds @ ind)[`dirs] , `$4 _ lsout
    :_n
  ]

  / Now it's a file size
  size: 0$*core.split[lsout;" "]
  size_paths: (-!#curr_dir) _\: curr_dir
  inds: &|/'+ds[;`path] ~\:/: size_paths
  ds[inds;`size]:: ds[inds;`size] + size
}

parse_com:{[com]
  :["$ cd"~4#com
    do_cd[5 _ com]
    do_ls[com]]
}

/ parse_com' test
parse_com' io.input

one_ans: +/ds[&ds[;`size] < 100000;`size]

need: 30000000 - 70000000 - ds[0;`size]
fsizes: ds[&ds[;`size] > need;`size]

two_ans: fsizes@*<fsizes

io.answer[one_ans;two_ans]

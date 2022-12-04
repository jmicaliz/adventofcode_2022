/ Okay so first read in the input file
io.DAY: 1
\l /advent/src/lib/io
\l /advent/src/lib/core

split_in: core.split[io.input;""]

sum_in: +/'0$split_in

one_ans: |/sum_in
two_ans: +/3#sum_in@>sum_in

io.answer[one_ans;two_ans]

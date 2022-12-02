/ Okay so first read in the input file

\l /advent/src/lib/core

pin: 0: "/advent/src/solutions/one/input"

split_pin: core.split[pin;""]

sum_pin: +/'0$split_pin

one_ans: |/sum_pin
two_ans: +/3#sum_pin@>sum_pin

`0: ,"Part one: " , $one_ans
`0: ,"Part two: " , $two_ans

."\\\\"

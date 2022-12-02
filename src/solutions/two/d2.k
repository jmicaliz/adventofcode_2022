pin: 0: "/advent/src/solutions/two/d2_input"

key_list: (`$(,/'3$,/`A `B `C ,/:\: `X `Y `Z)[;2 4 5])

rubric_one: . key_list ,' (4 8 3 1 5 9 7 2 6)

one_ans: |+/rubric_one @ `$pin

rubric_two: . key_list ,' (3 4 8 1 5 9 2 6 7)

two_ans: |+/rubric_two @ `$pin

`0: ,"Part one: " , $one_ans
`0: ,"Part two: " , $two_ans

."\\\\"

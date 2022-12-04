io.DAY: 2
\l /advent/src/lib/io

key_list: (`$(,/'3$,/`A `B `C ,/:\: `X `Y `Z)[;2 4 5])

rubric_one: . key_list ,' (4 8 3 1 5 9 7 2 6)

one_ans: |+/rubric_one @ `$io.input

rubric_two: . key_list ,' (3 4 8 1 5 9 2 6 7)

two_ans: |+/rubric_two @ `$io.input

io.answer[one_ans;two_ans]

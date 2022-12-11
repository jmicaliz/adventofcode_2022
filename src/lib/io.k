\d io
DAY: :[.[]~.[DAY;;:];0N;DAY]
DDAY: "d" , $DAY
DEBUG: 0

input: 0: "/advent/src/solutions/" , DDAY , "/" , DDAY , "_input"
test_input: 0: "/advent/src/solutions/" , DDAY , "/" , DDAY , "_test_input"

/ Get Input
gi:{[test]
  :(:[test;test_input;input])
}

debug:{[prefix;val]
  if[DEBUG
    `0: ,($prefix) , ": " , $val
  ]
}

answer:{[one_ans; two_ans]
  `0: ,"Part one: " , $one_ans
  `0: ,"Part two: " , $two_ans
}

\d ^

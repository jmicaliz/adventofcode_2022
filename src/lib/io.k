\d io
DAY: :[.[]~.[DAY;;:];0N;DAY]
DDAY: "d" , $DAY

input: 0: "/advent/src/solutions/" , DDAY , "/" , DDAY , "_input"

answer:{[one_ans; two_ans]
  `0: ,"Part one: " , $one_ans
  `0: ,"Part two: " , $two_ans
}

\d ^

load_solution:{[n]
  ."\\d d" , n
  `0: ,"Day " , n , " solutions:"
  ."\\l /advent/src/solutions/d", n , "/d" , n , ".k"
  `0: ,""
  ."\\d ^"
}

load_solution["1"]
load_solution["2"]
load_solution["3"]

."\\\\"

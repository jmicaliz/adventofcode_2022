\d core

split: {[list;el]
  out: (0,&el ~/: list) _ list
  :(1 # out) , (1 _' 1 _ out)
}

\d ^

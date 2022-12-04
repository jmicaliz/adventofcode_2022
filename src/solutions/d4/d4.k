/ Copy this template for the header and footer of the solution

io.DAY: 4 / Replace this with numeral of day
\l /advent/src/lib/io
\l /advent/src/lib/core

section_vals:{[section_nums]
  bounds: 0$core.split[section_nums;"-"]
  :((!bounds[1]) _dvl !bounds[0]) , bounds[1]
}

full_overlap_check:{[sections]
  ss: core.split[sections;","]
  svals: section_vals' ss
  :(&/|/'svals[0] ~/:\: svals[1]) | (&/|/'svals[1] ~/:\: svals[0])
}

partial_overlap_check:{[sections]
  ss: core.split[sections;","]
  svals: section_vals' ss
  :(|/|/'svals[0] ~/:\: svals[1])
}

one_ans: +/full_overlap_check' io.input
two_ans: +/partial_overlap_check' io.input

io.answer[one_ans;two_ans]

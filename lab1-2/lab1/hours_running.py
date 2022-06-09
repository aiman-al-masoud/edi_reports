with open("new_dumps.txt") as f:
	s = f.read()

num_dumps = len(s.split("START")) -1

print(5*num_dumps/60 , "hours"  )

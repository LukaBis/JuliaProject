using PrettyTables

data = [0 2 3 4 5 6; 1 2 3 4 5 6; 2 2 3 4 5 6; 3 2 3 4 5 6; 4 2 3 4 5 6; 5 2 3 4 5 6];
#println(data[2, 1])
pretty_table(data; header = ["", 1, 2, 3, 4, 5])

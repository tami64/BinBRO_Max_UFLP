# BinBRO_Max_UFLP
BinBRO: Binary Battle Royale Optimizer algorithm


The BinBRO algorithm has been implemented in MATLAB. The approach has been applied to two well-known benchmark datasets:
uncapacitated facility location and maximum-cut graph binary optimization problems.

The program's key modules are listed as follows.

The Get_Dataset function returns the file address and desired optimal value for the i_th instance.
The creat_model function returns the structure of i_th instance.
The BRO_Fun function applies the BinBRO algorithm to the i_th instance and returns the structure and convergence curve. The structure is a group items of performance evaluation criteria.
The write_on_text function generates a text file for the i_th instance and stores all performance criteria in this text file after a predetermined number of algorithm runs.
The write_on_text_all function generates a text file for all instances and stores all performance criteria in this text file after predetermined number of algorithm runs.

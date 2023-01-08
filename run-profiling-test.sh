set -x

#############     main        ##########################
# create a arg parse for number of runs ?

# https://www.tecmint.com/commands-to-collect-system-and-hardware-information-in-linux/
uname -a
# sudo lshw
# sudo lshw -html > lshw.html
# linux cpu
lscpu
# all block device information
# lsblk -a

date
#!/bin/bash

#  one line per file
python3 program_one_line_sequentially.py &>>report.program_one_line_sequentially.log
python3 program_one_line_with_processes.py &>>report.program_one_line_with_processes.log
python3 program_one_line_with_threads.py &>>report.program_one_line_with_threads.log
python3 program_one_line_with_processes_batch.py &>>report.program_one_line_with_processes_batch.log

# multiple lines per file
python3 program_multiple_lines_sequentially.py &>>report.program_multiple_lines_sequentially.log
python3 program_multiple_lines_with_threads.py &>>report.program_multiple_lines_with_threads.log
python3 program_multiple_lines_with_processes.py &>>report.program_multiple_lines_with_processes.log
python3 program_multiple_lines_with_processes_batch.py &>>report.program_multiple_lines_with_processes_batch.log

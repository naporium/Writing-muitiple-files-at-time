set -x

uname -a
# https://www.tecmint.com/commands-to-collect-system-and-hardware-information-in-linux/
# sudo lshw
# sudo lshw -html > lshw.html

# linux cpu
lscpu

# all block device information
lsblk -a

date
python3 program_multiple_lines.py &>>report.program_multiple.log
date
python3 program_multiple_lines_with_processes.py &>>report.program_multiple_lines_with_processes.log
date
python3 program_one_line.py &>>report.program_one_line.log
date
python3 program_one_line_with_processes.py &>>report.program_one_line_with_processes.log

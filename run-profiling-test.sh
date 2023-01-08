set -x

uname -a
# https://www.tecmint.com/commands-to-collect-system-and-hardware-information-in-linux/
# sudo lshw
# sudo lshw -html > lshw.html

# linux cpu
lscpu

# all block device information
# lsblk -a


echo "running program, one line per file"
date
python3 program_one_line_sequentially.py &>>report ."$(.date +'%G-%H%M%S')".program_one_line_sequentially.log
date
python3 program_one_line_with_processes.py &>>report ."$(.date +'%G-%H%M%S')".program_one_line_with_processes.log
date
python3 program_one_line_with_threads.py &>>report ."$(.date +'%G-%H%M%S')".program_one_line_with_threads.log
date
python3 program_one_line_with_processes_batch.py &>>report ."$(.date +'%G-%H%M%S')".program_one_line_with_processes_batch.log



echo "running program, multiple lines in files..."
date
python3 program_multiple_lines_sequentially.py &>>report ."$(.date +'%G-%H%M%S')".program_multiple_lines_sequentially.log
date
python3 program_multiple_lines_with_threads.py &>>report ."$(.date +'%G-%H%M%S')".program_multiple_lines_with_threads.log
date
python3 program_multiple_lines_with_processes.py &>>report ."$(.date +'%G-%H%M%S')".program_multiple_lines_with_processes.log
date
python3 program_multiple_lines_with_processes_batch.py &>>report ."$(.date +'%G-%H%M%S')".program_multiple_lines_with_processes_batch.log
."$(.date +'%G-%H%M%S')".

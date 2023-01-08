set -x


function run_test(){
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
}

function delete_report_files() {

  rm -f report.program_one_line_sequentially.log
  rm -f report.program_one_line_with_processes.log
  rm -f report.program_one_line_with_threads.log
  rm -f report.program_one_line_with_processes_batch.log

  rm -f report.program_multiple_lines_sequentially.log
  rm -f report.program_multiple_lines_with_threads.log
  rm -f report.program_multiple_lines_with_processes.log
  rm -f report.program_multiple_lines_with_processes_batch.log
}



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

RUNS_NUMBER=4
date
#!/bin/bash

bash disk-cleanup.sh
delete_report_files

for (( i=1; i<= $RUNS_NUMBER; i++ ))
  do
#    if [ $i -eq 0 ];
#      then
        echo "starting test $1"
        run_test
        python3 get_results.py $i
        # remove  tmp directory
        bash disk-cleanup.sh
        # remove report files
        delete_report_files
#    fi
#    else
#      run_test
#      python3 get_results.py $i
#      # remove  tmp directory
#      disk-cleanup.sh
#      # remove report files
#      delete_report_files
#    fi
  done

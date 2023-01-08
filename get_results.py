
def main(run_number):
    files = (
        "report.program_one_line_sequentially.log",
        "report.program_one_line_with_processes.log",
        "report.program_one_line_with_threads.log",
        "report.program_one_line_with_processes_batch.log",
        "report.program_multiple_lines_sequentially.log",
        "report.program_multiple_lines_with_threads.log",
        "report.program_multiple_lines_with_processes.log",
        "report.program_multiple_lines_with_processes_batch.log",
    )
    report_file = "report.log"
    reports = []

    for file in files:
        with open(file, "r") as fstream:
            report_line = fstream.readlines()[-1]
            reports.append(report_line)

    with open(report_file, "a") as fstream_out:
        fstream_out.write("\n\n")
        fstream_out.write("-----------------\n")
        fstream_out.write(f"  Run number: {run_number}\n")
        fstream_out.write("-----------------\n")
        fstream_out.write(f"[ One line per file ]\n")
        fstream_out.write("".join(reports[:4]))
        fstream_out.write(f"[ multiple lines per file ]\n")
        fstream_out.write("".join(reports[4:]))


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "rb",
        type=int,
        )
    args = parser.parse_args()

    main(args.rb)

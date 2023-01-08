# SuperFastPython.com
# create a large number od data files sequentially

from os import makedirs
from os.path import join
from function_profiller import time_fn


@time_fn
def save_file(filepath, data):
    """
    # save data to a file
    """
    # open the file
    with open(filepath, 'w') as handle:
        # save the data
        handle.write(data)


@time_fn
def generate_file(identifier, n_values=10, n_lines=5000):
    """
    # generate a csv file with v=10 values per line and l=5k lines
    """
    # generate many lines of data
    data = list()
    for i in range(n_lines):
        # generate a list of numeric values as strings
        line = [str(identifier+i+j) for j in range(n_values)]
        # convert list to string with values separated by commas
        data.append(','.join(line))
        # convert list of lines to a string separated by new lines
        return '\n'.join(data)


@time_fn
def generate_and_save(path, identifier):
    """
    # generate and save a file
    """
    # generate data
    data = generate_file(identifier)
    # create a unique filename
    filepath = join(path, f'data-{identifier:04d}.csv')
    # save data file to disk
    save_file(filepath, data)
    # report progress
    print(f'.saved {filepath}', flush=True)


@time_fn
def main(path='tmp2', n_files=5000):
    """
    # generate many data files in a directory
    """

    # create a local directory to save files
    makedirs(path, exist_ok=True)
    # create all files
    for i in range(n_files):
        generate_and_save(path, i)


# entry point
if __name__ == '__main__':

    main()

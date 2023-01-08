# SuperFastPython.com
# create a large number of data files concurrently with processes
from os import makedirs
from os.path import join
from concurrent.futures import ProcessPoolExecutor
from function_profiller import time_fn

# save data to a file
@time_fn
def save_file(filepath, data):
    # open the file
    with open(filepath, 'w') as handle:
        # save the data
        handle.write(data)


# generate a csv file with v=10 values per line and l=5k lines
@time_fn
def generate_file(identifier, n_values=10, n_lines=5000):
    # generate many lines of data
    data = list()
    for i in range(n_lines):
        # generate a list of numeric values as strings
        line = [str(identifier+i+j) for j in range(n_values)]
        # convert list to string with values separated by commas
        data.append(','.join(line))
        # convert list of lines to a string separated by new lines
        return '\n'.join(data)


# generate and save a file
@time_fn
def generate_and_save(path, identifiers):
    # generate each file
    for identifier in identifiers:
        # generate data
        data = generate_file(identifier)
        # create a unique filename
        filepath = join(path, f'data-{identifier:04d}.csv')
        # save data file to disk
        save_file(filepath, data)
        # report progress
        print(f'.saved {filepath}', flush=True)


# generate many data files in a directory
@time_fn
def main(path='tmp3', n_files=5000):
    # create a local directory to save files
    makedirs(path, exist_ok=True)

    # generate the file identifiers
    identifiers = [i for i in range(n_files)]
    # determine chunksize
    n_workers = 8
    chunk_size = round(len(identifiers) / n_workers)

    # create the process pool
    with ProcessPoolExecutor(8) as exe:
        # split the rename operations into chunks
        for i in range(0, len(identifiers), chunk_size):
            # select a chunk of filenames
            ids = identifiers[i:(i + chunk_size)]
            # submit file rename tasks
            _ = exe.submit(generate_and_save, path, ids)


# entry point
if __name__ == '__main__':
    main()

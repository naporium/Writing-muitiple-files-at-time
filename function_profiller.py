from functools import wraps
import time


def time_fn(fn):
    @wraps(fn)
    def measure_time(*args, **kwargs):
        t1 = time.time()
        result = fn(*args, **kwargs)
        t2 = time.time()
        print(f"@time_fn: {fn.__name__} took {t2-t1} seconds")
        return result
    return measure_time

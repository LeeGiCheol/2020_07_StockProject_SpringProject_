import multiprocessing
from codeTest import *


def worker(code):
    FastApi().makeChart(code, code+'.csv')
    return

if __name__ == '__main__':

    for i in range(2):
        p = multiprocessing.Process(target=worker, args=('005930', ))

        p.start()
        p.join()
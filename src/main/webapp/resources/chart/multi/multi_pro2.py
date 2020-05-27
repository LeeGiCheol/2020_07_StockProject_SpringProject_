import multiprocessing
import time
from codeTest import *

#시작시간
start_time = time.time()

#멀티쓰레드 사용 하는 경우 (20만 카운트)
#Pool 사용해서 함수 실행을 병렬
def count():
    FastApi().makeChart('005930')
    return



if __name__ == '__main__':
    for i in range(5):
        pool = multiprocessing.Pool(processes=4) # 현재 시스템에서 사용 할 프로세스 개수
        pool.map(count, "")
        pool.close()
        pool.join()

print("--- %s seconds ---" % (time.time() - start_time))

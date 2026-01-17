

import requests
import time
import threading
import concurrent.futures

thread_local = threading.local()

def get_session():
    if not hasattr(thread_local, "session"):
        thread_local.session = requests.Session()
    return thread_local.session

def download_site(url):
    session = get_session()
    with session.get(url) as response:
        print(f"Read {len(response.content)} from {url}")

def download_all_sites(sites):
    with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
        executor.map(download_site, sites)

if __name__ == "__main__":
    URLs = [
    "http://192.168.33.20/Backend/"
     
        ]

    start_time = time.time()
    download_all_sites(URLs * 80)
    duration = time.time() - start_time
    print(f"Downloaded {len(URLs) * 80} in {duration} s")



import threading
import requests

target_url = "http://192.168.33.20/Backend/"

def send_request():
    for _ in range(100):
        requests.get(target_url)

# Launch load testing with 10 threads
threads = []
for _ in range(10):
    thread = threading.Thread(target=send_request)
    threads.append(thread)
    thread.start()

for thread in threads:
    thread.join()


















#---------------------------------------------------------------------------------------------------------------
# import threading
# import requests

# target_url = "http://192.168.33.20/Backend/logincheck.php"

# def send_request():
#     for _ in range(100):
#         requests.get(target_url)

# # Launch load testing with 10 threads
# threads = []
# for _ in range(10):
#     thread = threading.Thread(target=send_request)
#     threads.append(thread)
#     thread.start()

# for thread in threads:
#     thread.join()

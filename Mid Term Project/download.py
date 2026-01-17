# # This script performs load testing on the Doctor-Appointment web 
# application by simulating multiple concurrent users accessing the application. 
# It does so by repeatedly downloading the endpoints of the application and
# measuring the time taken to complete the process. The script uses the requests library to 
# perform HTTP requests and the time module to measure the duration of the load test. 
# The goal of this script is to evaluate the performance and 
# scalability of the Doctor-Appointment web application under simulated concurrent user load. 
# The script downloads two endpoints, the Frontend doctor page and 
# the Backend page, 80 times each and calculates the total time taken for the process.



import requests
import time

def download_endpoint(endpoint, session):
    with session.get(endpoint) as response:
        print(f"Received {response.status_code} from {endpoint}")

def download_all_endpoints(endpoints):
    with requests.Session() as session:
        for endpoint in endpoints:
            download_endpoint(endpoint, session)

if __name__ == "__main__":
    endpoints = [
    "http://192.168.33.20/Backend/"
      
    ] * 80

    start_time = time.time()
    download_all_endpoints(endpoints)
    duration = time.time() - start_time
    print(f"Downloaded {len(endpoints)} endpoints in {duration} s")




   
import csv
import requests
import threading
import time

# Define the target URL for stress testing
target_url_1 = "http://192.168.33.20/Backend"
target_url_2 = "http://192.168.33.30/Backend"

# Number of concurrent users (threads) to simulate
concurrent_users = 100

# Number of requests per user
requests_per_user = 1000

# User credentials
credentials = {"Username": "admin", "Password": "admin"}

# Function to record the results to a CSV file
def record_result(user_id, response_time):
    with open("testing/stress_test_results.csv", "a", newline="") as csvfile:
        fieldnames = ["User ID", "Response Time (s)"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        if csvfile.tell() == 0:
            writer.writeheader()

        writer.writerow({"User ID": user_id, "Response Time (s)": response_time})

# Function to perform the HTTP request (login)
def make_request(user_id):
    for _ in range(requests_per_user):
        start_time = time.time()
        if(user_id % 2 == 1):
            response = requests.post(target_url_1, data=credentials)
        else:
            response = requests.post(target_url_2, data=credentials)
      
        end_time = time.time()
        response_time = end_time - start_time
        record_result(user_id, response_time)

# Main function to simulate concurrent users
def main():
    threads = []
    for i in range(concurrent_users):
        thread = threading.Thread(target=make_request, args=(i,))
        threads.append(thread)

    for thread in threads:
        thread.start()

    for thread in threads:
        thread.join()

if __name__ == "__main__":
    main()

import csv
import requests
import threading
import time

# Define the target URLs for stress testing
web_url = "http://192.168.33.20/Backend"
db_url = "http://192.168.33.30/Backend" 

# Number of concurrent users (threads) to simulate
concurrent_users = 100

# Number of requests per user
requests_per_user = 1000

# User credentials
credentials = {"Username": "admin", "Password": "admin"}

# Function to record the results to a CSV file
def record_result(user_id, response_time):
    with open("Testing/Modified_Stress_Test_results.csv", "a", newline="") as csvfile:
        fieldnames = ["User ID", "Response Time (s)"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        if csvfile.tell() == 0:
            writer.writeheader()

        writer.writerow({"User ID": user_id, "Response Time (s)": response_time})

# Function to perform the HTTP request (login)
def make_request(user_id):
    for request_number in range(1, requests_per_user + 1):
        start_time = time.time()
        if request_number % 2 == 1:  # Odd request
            response = requests.post(web_url, data=credentials)
        else:  # Even request
            response = requests.post(db_url, data=credentials)
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

import csv
from locust import HttpUser, task, between, events
from time import time

# URL of the deployed project
url = "http://192.168.33.20/Backend"
# Number of requests to simulate the expected load
num_requests = 100
# List to store the results of each request
results = []

# Custom user class inheriting from HttpUser
class WebsiteUser(HttpUser):
    # Set a random wait time between tasks for each user
    wait_time = between(1, 3)

    # Task to be executed by the user
    @task
    def access_website(self):
        # Record the start time of the request
        start_time = time()
        try:
            # Make a GET request to the specified URL
            response = self.client.get(url)
            # Record the end time of the request
            end_time = time()
            # Calculate the response time
            response_time = end_time - start_time
            # Save the response time and status code to the results list
            results.append((response_time, response.status_code))
        except Exception as e:
            # Print any exceptions that occur during the request
            print("Exception during request:", e)

# Event listener for when the test is quitting
@events.quitting.add_listener
def on_quitting(environment, **kwargs):
    # Function to save the results to a CSV file when the test is finished
    with open('load_testing_results.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        # Write the header row
        writer.writerow(["Response Time", "Status Code"])
        # Write all the result rows
        writer.writerows(results)

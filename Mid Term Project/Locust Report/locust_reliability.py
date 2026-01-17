
# 
# Defines a Locust user class `WebsiteUser` that simulates a user interacting with a website.
# The `WebsiteUser` class inherits from `HttpUser` and defines a single task `access_website` 
# that sends a GET request to the specified URL and checks the response status code. 
# If the status code is not 200, the task is marked as a failure, otherwise it is marked as a success.
# The `on_quitting` function is registered as a listener for the `quitting` event, 
# which is triggered when the Locust test is finished. This function opens a CSV file and 
# writes the response time and status code for each request to the file.
# The `WebsiteUser` class is configured with the URL, number of concurrent users, 
# and test duration. The `min_wait` attribute is set to 1000 milliseconds, 
# which is the minimum wait time between tasks.
# 



import csv
from locust import HttpUser, task, between, events

# URL of the deployed project
url = "http://192.168.33.20/Backend"  
# Number of concurrent users to simulate
num_users = 100  
# Duration of the test
test_duration = "10s"  
# List to store the results
results = []

# Defining a class to simulate a user interacting with the website
class WebsiteUser(HttpUser):
    # Setting the wait time between tasks to be between 1 and 3 seconds
    wait_time = between(1, 3)

    # Defining a task that will be executed by the user
    @task
    def access_website(self):
        # Sending a GET request to the URL and catching the response
        with self.client.get(url, catch_response=True) as response:
            # If the response status code is not 200, mark it as a failure
            if response.status_code != 200:
                response.failure(f"Failed to access website: {response.status_code}")
            # Otherwise, mark it as a success
            else:
                response.success()

# # Adding a listener to the quitting event to save the results when the test is done
# @events.quitting.add_listener
# def on_quitting(environment, **kwargs):
#     # Open a CSV file to write the results
#     with open('reliability_testing_results.csv', 'w', newline='') as file:
#         writer = csv.writer(file)
#         # Write the header row
#         writer.writerow(["Response Time", "Status Code"])
#         # Write the results
#         writer.writerows(results)


# Event listener for when the test is quitting
@events.quitting.add_listener
def on_quitting(environment, **kwargs):
    # Function to save the results to a CSV file when the test is finished
    with open('reliability_testing_results.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        # Write the header row
        writer.writerow(["Response Time", "Status Code"])
        # Write all the result rows
        writer.writerows(results)

# Set up the user count, duration, and other settings
# Assigning the URL to the host attribute of the WebsiteUser class
WebsiteUser.host = url
# Assigning the access_website task to the tasks attribute of the WebsiteUser class
WebsiteUser.tasks = [WebsiteUser.access_website]
# Setting the minimum wait time between tasks to 1000 milliseconds
WebsiteUser.min_wait = 1000 
# Setting the maximum wait time between tasks to 3000 milliseconds
WebsiteUser.max_wait = 3000

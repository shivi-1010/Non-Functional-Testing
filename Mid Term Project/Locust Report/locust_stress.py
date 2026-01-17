import csv
from locust import HttpUser, task, between, events

url = "http://192.168.33.20/Backend"   # URL of the deployed project
num_users = 1000  # Number of concurrent users to simulate
spawn_rate = 100  # Rate at which users are spawned per second
results = []

class WebsiteUser(HttpUser):
    wait_time = between(1, 3)

    @task
    def access_website(self):
        with self.client.get(url, catch_response=True) as response:
            response_time = response.elapsed.total_seconds() * 1000  # Convert to milliseconds
            status_code = response.status_code
            results.append((response_time, status_code))
            if status_code != 200:
                response.failure(f"Failed to access website: {status_code}")

@events.quitting.add_listener
def on_quitting(environment, **kwargs):
    # Save the results
    with open('stress_testing_results.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["Response Time", "Status Code"])
        writer.writerows(results)

# Set up the user count and spawn rate
WebsiteUser.wait_time = between(1, 3)
WebsiteUser.tasks = [WebsiteUser.access_website]
WebsiteUser.host = url

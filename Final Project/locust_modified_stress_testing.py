import csv
from locust import HttpUser, task, between, events

web_url = "http://192.168.33.20/Backend"
db_url = "http://192.168.33.30/Backend"  

num_users = 1000
spawn_rate = 100
results = []

class WebsiteUser(HttpUser):
    wait_time = between(1, 3)
    host = ""  # Placeholder for the host URL

    def on_start(self):
        if self.user_count % 2 == 1:  # Odd user ID
            self.host = web_url
        else:  # Even user ID
            self.host = db_url

    @task
    def access_website(self):
        with self.client.get("/", catch_response=True) as response:
            response_time = response.elapsed.total_seconds() * 1000
            status_code = response.status_code
            results.append((response_time, status_code))
            if status_code != 200:
                response.failure(f"Failed to access website: {status_code}")

@events.quitting.add_listener
def on_quitting(environment, **kwargs):
    with open('stress_testing_results.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["Response Time", "Status Code"])
        writer.writerows(results)

WebsiteUser.wait_time = between(1, 3)
WebsiteUser.tasks = [WebsiteUser.access_website]

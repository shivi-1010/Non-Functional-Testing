from locust import HttpUser, task, between
import pandas as pd
from urllib.parse import urlparse

class TestUserHttp(HttpUser):
    wait_time = between(1, 5)  # random wait time between 1 and 5 seconds
    host = "http://192.168.33.20"
    results_df = pd.DataFrame(columns=["Timestamp", "Name", "Status Code", "Request Type", "Response Time (ms)", "Response Length"])

    def save_result(self, response):
        url_path = urlparse(response.request.url).path
        page_name = url_path if url_path else "/"

        result = {
            "Timestamp": pd.Timestamp.now(),
            "Name": page_name,
            "Status Code": response.status_code,
            "Request Type": response.request.method,
            "Response Time (ms)": response.elapsed.total_seconds() * 1000,
            "Response Length": len(response.content),
        }

        self.results_df = pd.concat([self.results_df, pd.DataFrame([result])], ignore_index=True)

    @task
    def home_page(self):
        response = self.client.get("/Backend")
        self.save_result(response)

    @task
    def login(self):
        data = {
            "Username": "admin",
            "Password": "admin",
        }
        response = self.client.post("/Backend", data=data)
        self.save_result(response)

    def on_stop(self):
        self.results_df.to_csv("Results.csv", index=False)

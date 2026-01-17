# This script simulates the concurrent patient registration process using
# multithreaded programming in Python.
#
# Patient registration logic is simulated by a function called
# `patient_registration` that takes in a thread name as an argument.
#
# The main function creates a list of threads and starts them
# using the specified target function.
#
# It then joins each thread after creation, waiting for all
# threads to complete their execution before the program ends.
#
# This script can be modified to include real patient registration
# logic and adjust the number of concurrent patients using
# the `range` function in the main function.


import logging
import threading

# Define the function that will be executed in each thread
def patient_registration(name):
    logging.info(f"Thread {name}: starting patient registration.")
    # Add code here to handle patient registration logic
    import time
    time.sleep(3)  # Simulate some processing time
    logging.info(f"Thread {name}: patient registration complete.")


if __name__ == "__main__":
    format = "%(asctime)s: %(message)s "
    logging.basicConfig(format=format, level=logging.INFO, datefmt="%H: %M: $S")
    
    # Create a list to hold all the threads
    threads = []

    # Create and start 5 threads to simulate 5 concurrent patients
    for index in range(5):
        logging.info(f"Main     : creating and starting thread {index}.")
        thread = threading.Thread(target=patient_registration, args=(index,))
        threads.append(thread)
        thread.start()

    # Wait for all threads to complete
    for index, thread in enumerate(threads):
        logging.info(f"Main     : waiting for thread {index} to complete.")
        thread.join()
        logging.info(f"Main     : thread {index} complete.")

    logging.info("Main     : all threads complete.")



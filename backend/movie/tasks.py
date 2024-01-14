from celery import shared_task
import time

@shared_task
def simulate_process():
    time.sleep(10)
    print("Simulated 10 seconds process.")
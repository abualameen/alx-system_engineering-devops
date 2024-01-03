#!/usr/bin/python3
"""
A Python script that fetches TODO list progress for a
given employee ID using a REST API.

"""

import requests
import sys


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./0-gather_data_from_an_API.py <employee_id>")
        sys.exit(1)
    base_url = "https://jsonplaceholder.typicode.com/users/{}/todos"
    employee_id = sys.argv[1]

    try:
        response = requests.get(base_url.format(employee_id))
        todos = response.json()
        user_response = requests.get(
            "https://jsonplaceholder.typicode.com/users/{}".format(employee_id)
            )
        employee_name = user_response.json().get("name")
        completed_tasks = [task for task in todos if task.get("completed")]
        total_tasks = len(todos)
        num_completed_tasks = len(completed_tasks)

        print(
                f"Employee {employee_name} is done with\
                tasks({num_completed_tasks}/{total_tasks}):"
            )
        for task in completed_tasks:
            print(f"\t {task.get('title')}")

    except Exception as e:
        print(f"An error occurred: {e}")

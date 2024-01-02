#!/usr/bin/python3
"""
A Python script that fetches TODO list progress for a given
employee ID using a REST API and exports data in JSON format.

"""

import requests
import sys
import json


if __name__ == "__main__":
    # Check if the correct number of arguments is provided
    if len(sys.argv) != 2:
        print("Usage: ./2-export_to_JSON.py <employee_id>")
        sys.exit(1)
    base_url = "https://jsonplaceholder.typicode.com/users/{}/todos"
    employee_id = sys.argv[1]

    try:
        response = requests.get(base_url.format(employee_id))
        todos = response.json()
        user_response = requests.get(
            "https://jsonplaceholder.typicode.com/users/{}".format(employee_id)
            )
        username = user_response.json().get("username")
        data = {
                employee_id: [
                    {
                        "task": todo.get("title"),
                        "completed": todo.get("completed"),
                        "username": username
                    }
                    for todo in todos
                   ]
                }
        file_name = f"{employee_id}.json"
        with open(file_name, 'w') as json_file:
            json.dump(data, json_file)
        print(f"Data exported to {file_name}")
    except Exception as e:
        print(f"An error occurred: {e}")

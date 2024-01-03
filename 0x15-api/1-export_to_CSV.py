#!/usr/bin/python3
"""
A Python script that fetches TODO list progress for a given
employee ID using a REST API and exports data in CSV format.

"""

import requests
import sys
import csv


if __name__ == "__main__":
    # Check if the correct number of arguments is provided
    if len(sys.argv) != 2:
        print("Usage: ./1-export_to_CSV.py <employee_id>")
        sys.exit(1)

    base_url = "https://jsonplaceholder.typicode.com/users/{}/todos"

    employee_id = sys.argv[1]

    try:
        response = requests.get(base_url.format(employee_id))
        todos = response.json()

        user_response = requests.get(
           "https://jsonplaceholder.typicode.com/users/{}".format(employee_id)
        )
        employee_name = user_response.json().get("username")

        file_name = f"{employee_id}.csv"

        with open(file_name, mode='w', newline='') as file:
            csv_writer = csv.writer(file, quoting=csv.QUOTE_ALL)
            for todo in todos:
                csv_writer.writerow(
                    [
                        employee_id,
                        employee_name,
                        todo.get("completed"),
                        todo.get("title")
                    ]
                        )

        print(f"Data exported to {file_name}")

    except Exception as e:
        print(f"An error occurred: {e}")

import requests
import json


def fetch_users():
    """Fetch user data from the given API endpoint."""
    response = requests.get('https://jsonplaceholder.typicode.com/users')
    if response.status_code == 200:
        return response.json()
    else:
        print('Failed to fetch users!')
        return []


def fetch_todos(user_id):
    """Fetch todos for a specific user."""
    response = requests.get(
        f'https://jsonplaceholder.typicode.com/todos?userId={user_id}'
    )
    if response.status_code == 200:
        return response.json()
    else:
        print(f'Failed to fetch todos for user ID: {user_id}')
        return []


def structure_data(users):
    """Structure data according to the required format."""
    structured_data = {}
    for user in users:
        user_id = user['id']
        todos = fetch_todos(user_id)
        structured_data[user_id] = [
            {
                'username': user['username'],
                'task': todo['title'],
                'completed': todo['completed']
            } for todo in todos
        ]
    return structured_data


def export_to_json(data, filename='todo_all_employees.json'):
    """Export structured data to a JSON file."""
    with open(filename, 'w') as file:
        json.dump(data, file)


def main():
    """Main function to fetch, structure, and export data."""
    users = fetch_users()
    structured_data = structure_data(users)
    export_to_json(structured_data)
    print('Data exported to todo_all_employees.json')


if __name__ == '__main__':
    main()

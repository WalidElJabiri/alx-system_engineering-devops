#!/usr/bin/python3
"""
Exports data in the JSON format.
"""

import json
import requests
import sys

if __name__ == "__main__":
    """main"""
    id = sys.argv[1]
    usr_url = "https://jsonplaceholder.typicode.com/users/{}".format(id)
    todos_url = "https://jsonplaceholder.typicode.com/users/{}/todos".format(id)

    u = requests.get(usr_url).json()
    tds = requests.get(todos_url).json()

    with open('{}.json'.format(id), 'w') as json_file:
        tasks = []
        for t in tds:
            tasks.append({"task": t.get("title"),
                        "completed": t.get("completed"),
                        "username": u.get("username")})
            data = {"{}".format(id): tasks}
            json.dump(data, json_file)

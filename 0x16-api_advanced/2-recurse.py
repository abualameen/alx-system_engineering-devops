#!/usr/bin/python3
"""
2-recurse
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """
    Recursively queries the Reddit API and returns a list containing the titles
    of all hot articles for a given subreddit.

    Args:
        subreddit (str): The subreddit to query.
        hot_list (list): List to store titles of hot articles (default: []).
        after (str): Parameter to paginate through responses (default: None).

    Returns:
        list: List containing the titles of hot articles
        or None if no results are found.
    """
    if not hot_list:
        url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=100"
    else:
        url = f"https://www.reddit.com/r/{subreddit}/hot.json?" \
              f"limit=100&after={after}"

    headers = {
        'User-Agent': ('Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                       'AppleWebKit/537.36 (KHTML, like Gecko) '
                       'Chrome/58.0.3029.110 Safari/537.3')
    }

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 200:
        posts = response.json().get('data', {}).get('children', [])
        if not posts:
            return hot_list
        else:
            for post in posts:
                hot_list.append(post['data']['title'])
            after = response.json().get('data', {}).get('after')
            return recurse(subreddit, hot_list, after)
    else:
        return None

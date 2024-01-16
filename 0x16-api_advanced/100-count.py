#!/usr/bin/python3
"""
100-count
"""
import requests


def count_words(subreddit, word_list, after=None, word_count={}):
    """
    Recursively counts occurrences of keywords in the titles of hot articles.
    Prints results in descending order by count, then alphabetically.
    """
    if after is None:
        word_count = {}  # Reset word count for each recursion

    url = f"https://www.reddit.com/r/{subreddit}/hot.json?" \
          f"limit=100&after={after}"
    headers = {
        'User-Agent': ('Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                       'AppleWebKit/537.36 (KHTML, like Gecko) '
                       'Chrome/58.0.3029.110 Safari/537.3')
    }

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        return

    data = response.json().get('data', {})
    children = data.get('children', [])

    for post in children:
        title = post.get('data', {}).get('title', '').lower()
        for word in word_list:
            if word.lower() in title:
                word_count[word] = word_count.get(word, 0) + 1

    after = data.get('after')

    if after is not None:
        count_words(subreddit, word_list, after, word_count)
    else:
        print_results(word_count)


def print_results(word_count):
    """
    Prints the results in descending order by count, then alphabetically.
    """
    sorted_words = sorted(word_count.items(), key=lambda x: (-x[1], x[0]))

    for word, count in sorted_words:
        print(f"{word}: {count}")

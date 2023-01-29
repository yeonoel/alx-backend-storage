#!/usr/bin/env python3
""" Implementing an expiring web cache and tracker. """

from functools import wraps
import redis
import requests
from typing import Callable

r = redis.Redis()


def count_requests(method: Callable) -> Callable:
    """ Decorator for counting """
    @wraps(method)
    def wrapper(url):
        """ Wrapper for decorator """
        r.incr(f"count:{url}")
        cached_html = r.get(f"cached:{url}")
        if cached_html:
            return cached_html.decode('utf-8')
        html = method(*args, **kwargs)
        r.set(f"cached:{url}", html, 10)
        return html

    return wrapper


@count_requests
def get_page(url: str) -> str:
    """ Obtain the HTML content of a  URL """
    return requests.get(url).text

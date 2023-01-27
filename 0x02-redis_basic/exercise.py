#!/usr/bin/env python3
"""working with redis and python."""


from typing import Callable, Optional, Union
import uuid
import redis
from functools import wraps


class Cache:
    """Cache class"""
    def __init__(self): 
        """initializes the Cache class."""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Store data in the cache"""
        randomKey = str(uuid.uuid4())
        self._redis.set(randomKey, data)

        return randomKey

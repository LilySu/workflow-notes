# Sort dictionary by value
"""
def get_key(e):
    return e[1]

items.sort(key=get_key)
"""
items.sort(key=lambda e: e[1])

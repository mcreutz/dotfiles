### Capslock + i/j/k/l as arrow keys
- If you want to keep the functionality of the Capslock key, add the "to_if_alone" section:
    "to_after_key_up": [...],
    "to_if_alone": [
        {
            "key_code": "caps_lock"
        }
    ],
# Foundation-of-Computer-Science
## Encoding and Decoding
###Secure Encoding & Decoding App (Docker + Python)
- A simple Python project that demonstrates data encoding and decoding techniques used in modern web communication.
The application supports Base64 encoding, URL encoding, and Base64 decoding and runs inside a Docker container.
This project helps beginners understand how encoding is used in web protocols, APIs, and data transmission.
### Technologies Used
- Python3
- Docker
- Base64 Encoding
- Base64 Decoding
- URL Encdoing
- Command Line Interface
## How thw Program Work
1. Encode Text
2. Decode Base64
3. Exit Program
When text is entered, it converts the text into:
Base64 encoded format
URL encoded format
These formats are commonly used in:
Web authentication
API communication
Email transmission
Data transfer across HTTP/HTTPS
## Code for encoding and decoding
```

import base64
import urllib.parse

def encode_text(text):
    """Encode text to Base64 and URL format"""
    base64_encoded = base64.b64encode(text.encode()).decode()
    url_encoded = urllib.parse.quote(text)
    return base64_encoded, url_encoded

def decode_text(base64_text):
    """Decode Base64 text"""
    try:
        decoded = base64.b64decode(base64_text).decode()
        return decoded
    except Exception as e:
        return f"Error decoding: {e}"

def main():
    while True:
        print("\n=== Simple Encoding & Decoding ===")
        print("1. Encode Text")
        print("2. Decode Base64")
        print("3. Exit")
        choice = input("Enter your choice (1/2/3): ")

        if choice == "1":
            text = input("Enter text to encode: ")
            base64_encoded, url_encoded = encode_text(text)
            print(f"Base64 Encoded: {base64_encoded}")
            print(f"URL Encoded: {url_encoded}")
        elif choice == "2":
            base64_text = input("Enter Base64 text to decode: ")
            decoded = decode_text(base64_text)
            print(f"Decoded Text: {decoded}")
        elif choice == "3":
            print("Exiting... Goodbye!")
            break
        else:
            print("Invalid choice. Please enter 1, 2, or 3.")

if __name__ == "__main__":
    main()
```
### Output
```
=== Simple Encoding & Decoding ===
1. Encode Text
2. Decode Base64
3. Exit
Enter your choice (1/2/3): 1
Enter text to encode: Ritisha
Base64 Encoded: Uml0aXNoYQ==
URL Encoded: Ritisha

1. Encode Text
2. Decode Base64
3. Exit
Enter your choice (1/2/3): 2
Enter Base64 text to decode: Uml0aXNoYQ==
Decoded Text: Ritisha
```

## Creating database and table
```
CREATE DATABSE CLUB;
```

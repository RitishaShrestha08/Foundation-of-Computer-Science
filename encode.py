# beginner_encoding_decoding.py
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
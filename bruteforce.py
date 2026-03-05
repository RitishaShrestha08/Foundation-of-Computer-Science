import itertools

students = ["A", "B", "C", "D"]

friends = {
    "A": ["B"],
    "B": ["A"],
    "C": ["D"],
    "D": ["C"]
}

city = {
    "A": "Kathmandu",
    "B": "Pokhara",
    "C": "Kathmandu",
    "D": "Biratnagar"
}

def is_valid(arrangement):
    for i in range(len(arrangement) - 1):
        s1 = arrangement[i]
        s2 = arrangement[i + 1]

        # Check friend rule
        if s2 in friends[s1]:
            return False

        # Check same city rule
        if city[s1] == city[s2]:
            return False

    return True

# Try all permutations
for perm in itertools.permutations(students):
    if is_valid(perm):
        print("Valid Seating:", perm)
        break
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

        # Rule 1: Friends cannot sit together
        if s2 in friends[s1]:
            return False

        # Rule 2: Same city cannot sit together
        if city[s1] == city[s2]:
            return False

    return True

def solve(arrangement, remaining):
    if not remaining:
        return arrangement

    for student in remaining:
        new_arr = arrangement + [student]
        if is_valid(new_arr):
            result = solve(new_arr, [s for s in remaining if s != student])
            if result:
                return result

    return None

result = solve([], students)

if result:
    print("Valid Seating Found:", result)
else:
    print("No valid arrangement found")
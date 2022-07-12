class_name NumberToWords

const ONES = {
	0: "",
	1: "one",
	2: "two",
	3: "three",
	4: "four",
	5: "five",
	6: "six",
	7: "seven",
	8: "eight",
	9: "nine",
	10: "ten",
	11: "eleven",
	12: "twelve",
	13: "thirteen",
	14: "fourteen",
	15: "fifteen",
	16: "sixteen",
	17: "seventeen",
	18: "eighteen",
	19: "nineteen"
}

const TENS = {
	2: "twenty",
	3: "thirty",
	4: "forty",
	5: "fifty",
	6: "sixty",
	7: "seventy",
	8: "eighty",
	9: "ninety"
}

const ILLIONS = {
	1: "thousand", 2: "million", 3: "billion", 4: "trillion", 5: "quadrillion", 6: "quintillion"
}  # hit the godot int limit here - sorry

const ORDS = {
	"one": "first",
	"two": "second",
	"three": "third",
	"four": "fourth",
	"five": "fifth",
	"six": "sixth",
	"seven": "seventh",
	"eight": "eighth",
	"nine": "ninth",
	"ten": "tenth",
	"eleven": "eleventh",
	"twelve": "twelfth"
}


# Convert an integer in to its word representation.
static func to_words(i) -> String:
	if not i:
		return "zero"

	if i is int:
		if i < 0:
			return _join(["minus", to_cardinal(-i)])
		return to_cardinal(i)
	if i is float:
		if i < 0:
			return _join(["minus", _convert_float(-i)])
		return _convert_float(i)
	if i is String:
		if i.is_valid_float():
			return to_words(float(i))
		return to_words(int(i))
	return str(i)


static func to_ordinal(value: int):
	var outwords = to_words(value).split(" ")
	var lastword = outwords[-1]

	if ORDS.has(lastword):
		lastword = ORDS[lastword]
	else:
		if lastword[-1] == "y":
			lastword = lastword.substr(0, lastword.length() - 1) + "ie"
		lastword += "th"
	outwords[-1] = lastword
	return outwords.join(" ")


static func to_cardinal(i: int) -> String:
	if i < 20:
		return ONES[i]
	if i < 100:
		return _join([TENS[i / 10], ONES[i % 10]])
	if i < 1000:
		return _divide(i, 100, "hundred")
	var illions_name := ""
	var illions_number := 0
	for number in ILLIONS.keys():
		illions_number = number
		illions_name = ILLIONS[illions_number]
		if i < pow(1000, illions_number + 1):
			break
	return _divide(i, pow(1000, illions_number), illions_name)


static func to_year(i: int) -> String:
	var string_number = str(i)
	var decade = int(string_number.substr(0, string_number.length() - 2))
	var year = int(string_number.right(string_number.length() - 2))

	if (i < 1000 and year == 0) or i < 100:
		return to_words(i)

	if year < 10:
		if not decade % 10:
			return to_words(i)
		if year == 0:
			return _join([to_words(decade), "hundred"])
		return _join([to_words(decade), to_cardinal_numbers("%02d" % year, "oh")])

	return _join([to_words(decade), to_words(year)])


static func to_cardinal_numbers(i: String, zero_replace := "zero") -> String:
	var to_join := []
	for c in i:
		var word = to_cardinal(int(c))
		if not word:
			word = zero_replace
		to_join.append(word)
	return _join(to_join)


static func _convert_float(i: float):
	var segments = str(i).split(".")
	var to_join = [to_cardinal(int(segments[0])), "point"]
	to_join.append(to_cardinal_numbers(segments[1]))
	return _join(to_join)


static func _divide(dividend: int, divisor: int, magnitude: String):
	if not dividend % divisor:
		return _join([to_cardinal(dividend / divisor), magnitude, to_cardinal(dividend % divisor)])
	if dividend % divisor < 100:
		return _join(
			[to_cardinal(dividend / divisor), magnitude, "and", to_cardinal(dividend % divisor)]
		)
	return _join(
		[to_cardinal(dividend / divisor), magnitude + ",", to_cardinal(dividend % divisor)]
	)


static func _join(args: PoolStringArray) -> String:
	var to_join := PoolStringArray([])
	for arg in args:
		if arg:
			to_join.append(arg)
	return to_join.join(" ")

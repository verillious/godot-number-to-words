extends "res://addons/gut/test.gd"


func test_cardinal():
	assert_eq(NumberToWords.to_words(0), "zero")
	assert_eq(NumberToWords.to_words(1), "one")
	assert_eq(NumberToWords.to_words(2), "two")
	assert_eq(NumberToWords.to_words(3), "three")
	assert_eq(NumberToWords.to_words(4), "four")
	assert_eq(NumberToWords.to_words(5), "five")
	assert_eq(NumberToWords.to_words(6), "six")
	assert_eq(NumberToWords.to_words(7), "seven")
	assert_eq(NumberToWords.to_words(8), "eight")
	assert_eq(NumberToWords.to_words(9), "nine")
	assert_eq(NumberToWords.to_words(10), "ten")
	assert_eq(NumberToWords.to_words(11), "eleven")
	assert_eq(NumberToWords.to_words(12), "twelve")
	assert_eq(NumberToWords.to_words(13), "thirteen")
	assert_eq(NumberToWords.to_words(14), "fourteen")
	assert_eq(NumberToWords.to_words(15), "fifteen")
	assert_eq(NumberToWords.to_words(16), "sixteen")
	assert_eq(NumberToWords.to_words(17), "seventeen")
	assert_eq(NumberToWords.to_words(18), "eighteen")
	assert_eq(NumberToWords.to_words(19), "nineteen")
	assert_eq(NumberToWords.to_words(20), "twenty")
	assert_eq(NumberToWords.to_words(30), "thirty")
	assert_eq(NumberToWords.to_words(40), "forty")
	assert_eq(NumberToWords.to_words(50), "fifty")
	assert_eq(NumberToWords.to_words(60), "sixty")
	assert_eq(NumberToWords.to_words(70), "seventy")
	assert_eq(NumberToWords.to_words(80), "eighty")
	assert_eq(NumberToWords.to_words(90), "ninety")
	assert_eq(NumberToWords.to_words(100), "one hundred")
	assert_eq(NumberToWords.to_words(101), "one hundred and one")
	assert_eq(NumberToWords.to_words(111), "one hundred and eleven")
	assert_eq(NumberToWords.to_words(199), "one hundred and ninety nine")
	assert_eq(NumberToWords.to_words(1111), "one thousand, one hundred and eleven")
	assert_eq(NumberToWords.to_words(1111000), "one million, one hundred and eleven thousand")
	assert_eq(NumberToWords.to_words(1111000000), "one billion, one hundred and eleven million")
	assert_eq(
		NumberToWords.to_words(1111000099),
		"one billion, one hundred and eleven million and ninety nine"
	)
	assert_eq(
		NumberToWords.to_words(5001111000099),
		"five trillion, one billion, one hundred and eleven million and ninety nine"
	)
	assert_eq(NumberToWords.to_words(6000000000000000000), "six quintillion")


func test_cardinal_for_float_number():
	assert_eq(NumberToWords.to_words(12.5), "twelve point five")
	assert_eq(NumberToWords.to_words(12.51), "twelve point five one")
	assert_eq(NumberToWords.to_words(12.53), "twelve point five three")
	assert_eq(NumberToWords.to_words(12.59), "twelve point five nine")
	assert_eq(NumberToWords.to_words(-12.59), "minus twelve point five nine")


func test_cardinal_numbers():
	assert_eq(NumberToWords.to_cardinal_numbers(12), "one two")
	assert_eq(NumberToWords.to_cardinal_numbers(102.78), "one zero two point seven eight")
	assert_eq(NumberToWords.to_cardinal_numbers(-12.78), "minus one two point seven eight")


func test_ordinal():
	assert_eq(NumberToWords.to_ordinal(0), "zeroth")
	assert_eq(NumberToWords.to_ordinal(1), "first")
	assert_eq(NumberToWords.to_ordinal(13), "thirteenth")
	assert_eq(NumberToWords.to_ordinal(22), "twenty second")
	assert_eq(NumberToWords.to_ordinal(12), "twelfth")
	assert_eq(NumberToWords.to_ordinal(130), "one hundred and thirtieth")
	assert_eq(NumberToWords.to_ordinal(1003), "one thousand and third")


func test_ordinal_number():
	assert_eq(NumberToWords.to_ordinal_number(0), "0th")
	assert_eq(NumberToWords.to_ordinal_number(1), "1st")
	assert_eq(NumberToWords.to_ordinal_number(13), "13th")
	assert_eq(NumberToWords.to_ordinal_number(22), "22nd")
	assert_eq(NumberToWords.to_ordinal_number(12), "12th")
	assert_eq(NumberToWords.to_ordinal_number(130), "130th")
	assert_eq(NumberToWords.to_ordinal_number(1003), "1003rd")
	assert_eq(NumberToWords.to_ordinal_number(-1003), "-1003rd")


func test_to_year():
	assert_eq(NumberToWords.to_year(1990), "nineteen ninety")
	assert_eq(NumberToWords.to_year(5555), "fifty five fifty five")
	assert_eq(NumberToWords.to_year(2017), "twenty seventeen")
	assert_eq(NumberToWords.to_year(1066), "ten sixty six")
	assert_eq(NumberToWords.to_year(1865), "eighteen sixty five")
	assert_eq(NumberToWords.to_year(3000), "three thousand")
	assert_eq(NumberToWords.to_year(2001), "two thousand and one")
	assert_eq(NumberToWords.to_year(1901), "nineteen oh one")
	assert_eq(NumberToWords.to_year(2000), "two thousand")
	assert_eq(NumberToWords.to_year(905), "nine oh five")
	assert_eq(NumberToWords.to_year(6600), "sixty six hundred")
	assert_eq(NumberToWords.to_year(1900), "nineteen hundred")
	assert_eq(NumberToWords.to_year(600), "six hundred")
	assert_eq(NumberToWords.to_year(50), "fifty")
	assert_eq(NumberToWords.to_year(0), "zero")


func test_weird_numbers():
	assert_eq(NumberToWords.to_words(89_000), "eighty nine thousand")
	assert_eq(NumberToWords.to_words(0x8f51), "thirty six thousand, six hundred and eighty nine")
	assert_eq(NumberToWords.to_words(0b101010), "forty two")
	assert_eq(NumberToWords.to_words(58.1e-2), "point five eight one")
	assert_eq(NumberToWords.to_words(4e-2), "point zero four")
	assert_eq(
		NumberToWords.to_words(0.0000009),
		"point zero zero zero zero zero one",
		"godot floats are single-precision"
	)
	assert_eq(NumberToWords.to_words(0.00000009), "zero", "godot floats are single-precision")

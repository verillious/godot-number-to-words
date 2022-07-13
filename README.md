# 📜 Number To Words

[![Made with Godot](https://img.shields.io/badge/Made%20with-Godot%203.4-478CBF?style=flat&logo=godot%20engine&logoColor=white)](https://godotengine.org)
![Pulse](https://img.shields.io/github/commit-activity/m/verillious/godot-number-to-words)
![Checks](https://github.com/verillious/godot-number-to-words/actions/workflows/godot-tests.yml/badge.svg)


> Convert numbers to words in GDScript

## 🖊️ Usage

### `NumberToWords.to_words(number) -> String`
```python
print(NumberToWords.to_words(1111000000))
> "one billion, one hundred and eleven million"

print(NumberToWords.to_words(12.5))
> "twelve point five"

print(NumberToWords.to_words(-12.59))
> "minus twelve point five nine"

print(NumberToWords.to_words(89_000))
> "eighty nine thousand"

print(NumberToWords.to_words(0x8f51))
> "thirty six thousand, six hundred and eighty nine"

print(NumberToWords.to_words(0b101010))
> "forty two"

print(NumberToWords.to_words(58.1e-2))
> "point five eight one"
```


### `NumberToWords.to_ordinal(number: int) -> String`
```python
print(NumberToWords.to_ordinal(1))
> "first"

print(NumberToWords.to_ordinal(22))
> "twenty second"

print(NumberToWords.to_ordinal(1003))
> "one thousand and third"
```

### `NumberToWords.to_ordinal_number(number: int) -> String`
```python
print(NumberToWords.to_ordinal_number(1))
> "1st"

print(NumberToWords.to_ordinal_number(22))
> "22nd"

print(NumberToWords.to_ordinal_number(1003))
> "1003rd"
```

### `NumberToWords.to_year(number: int) -> String`
```python
print(NumberToWords.to_year(1990))
> "nineteen ninety"

print(NumberToWords.to_year(2017))
> "twenty seventeen"

print(NumberToWords.to_year(1066))
> "ten sixty six"

print(NumberToWords.to_year(1865))
> "eighteen sixty five"

print(NumberToWords.to_year(2001))
> "two thousand and one"

print(NumberToWords.to_year(1901))
> "nineteen oh one"
```

🙏 Credits
-------

🍪 This project was created with [cookiecutter](https://github.com/audreyr/cookiecutter) and the [verillious/cookiecutter-godot](https://github.com/verillious/cookiecutter-godot) project template.

🎨 <a href="https://www.flaticon.com/free-icons/number" title="number icons">Icon created by Freepik - Flaticon</a>

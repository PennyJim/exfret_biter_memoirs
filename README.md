# exfret Biter Memoirs

Gives biters names and prints out memoirs of their life when they die every now and then. Increase your empathy and understanding of the natural inhabitants of the world around you as you ravage their home, sicken their environment, and destroy whole familial lines.

Inspired by https://xkcd.com/873/

## Description

* You can add this to existing saves, or remove it mid-save
* It should be compatible with all mods
* An ever-growing list of names and stories

## Getting Started

### Dependencies

* Factorio
* Sense of humour (optional)

### Installing

* Download from the MOD portal
* Download from GITHUB

## Remote Interface
#### Name: `"biter-memoirs"`
Types:
- `pronoun_id` - An id of a given pronoun class
	- Technically any integer can be a `pronoun_id` since they're implemented using locale plurals, but any outside the given set is not guaranteed to have the memoirs work correctly.
	- The current values are as follows:
		- `-2` is `"any"` which will randomly choose a positive value
		- `-1` is `"either"` which will randomly choose either `male` or `female`
		- `0` is `"they"`
		- `1` is `"male"`
		- `2` is `"female"`
- `name_info` - The object describing what a name is
	- `name` - The string value of the name
	- `pronouns` - The `pronoun_id` of the name.
	- `special_memoir`? - A specific LocalisedString to use when printing this name's memoir.
	- `color`? - A color to use when printing this name's memoir. Unused in the defaults.
- `MemoirString` - Can either be a string, or a LocalisedString with considerations
	- If it's a LocalisedString, the 1st and 2nd parameters (2nd and 3rd indexes) are *always* set to the name and `pronoun_id` of what's being memoir'ed. For this reason any given Memoirs will error if these values are set.

Functions:
- Name functions:
	- `get_names`/`set_names` - Works with contiguous arrays of `name_info`.
	- `add_name` - Adds a `name_info` to the end of the array, and returns its index.
	- `remove_name` - Removes the value at the given index in the array of names.
	- `get_name_count` - Returns the current number of names.
	- `get_default_names` - Returns the current default list of names.
- Memoir functions:
	- `get_memoirs`/`set_memoirs` - Works with contiguous arrays of `MemoirString`.
	- `add_memoir` - Adds a `MemoirString` to the end of the array, and returns its index.
	- `remove_name` - Removes the value at the given index in the array of memoirs.
	- `get_memoir_count` - Returns the current number of memoirs.
	- `get_default_memoirs` - Returns the default list of memoirs.
	- `generate_default_memoirs` - Creates a default list of memoirs with the given number of entries.
		- The `get_default_memoirs` function internally uses this function with a statically defined number.
- Other functions:
	- `get_pronouns` - Returns the enum mapping a string to the `pronoun_id`.

## Help

Just ping me (@pennyjim or <@214446390552690689>) on the (Officially) [Unofficial Factorio Discord](https://discord.gg/factorio).


## Authors

exfret, PennyJim

Contributors: Cobai
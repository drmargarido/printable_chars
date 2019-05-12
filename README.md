# Printable Chars

Simple lib for getting the printable ascii characters of a lua string

## Example Usage

```lua
local printable_chars = require "printable_chars".printable_chars

-- Print random characters from urandom
local urandom = io:open("/dev/urandom", "r")
print(printable_chars(urandom:read(32)))                           -- U&0j]s7\]r9\ (Example)
urandom:close()

-- Validate fields
local raw_password = "çç~asdasdasd  \n\n\r\tasdáá"
if raw_password ~= printable_chars(raw_password) then              -- True
    print("Do not use invalid ascii characters in the password")
end
```

Check [spec](spec/app_spec.lua) file for more examples

## Available methods

* printable_chars - Returns string with just the ascii printable characters
* is_char_printable - Checks if a char is printable
* set_spaces_allowed - Sets the lib to accept special space chars as printable chars
* blacklist_chars - Blacklists a list of specific chars so the next printable_chars calls will ignore them

## Testing

To run the unit tests we need the busted lib.
```sh
luarocks install busted
```

After that just run the following command.
```sh
busted spec
```

## Instalation

```sh
luarocks install printable_chars
```

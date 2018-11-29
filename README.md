# Printable Chars

Simple lib for getting the printable ascii characters of a lua string

## Example Usage

```lua
local printable_chars = require "printable_chars".printable_chars

-- Print random characters from urandom
local urandom = io:open("/dev/urandom", "r")
print(printable_chars(urandom:read(32)))
urandom:close()

-- Validate fields
local raw_password = "çç~asdasdasd  \n\n\r\tasdáá"
if raw_password ~= printable_chars(raw_password) then
    print("Do not use invalid ascii characters in the password")
end
```

* Check [example.lua](example.lua) file for more examples

## Available methods

* printable_chars - Returns string with just the ascii printable characters
* is_char_printable - Checks if a char is printable
* set_spaces_allowed - Sets the lib to accept special space chars as printable chars

## Instalation

```sh
luarocks install printable_chars
```

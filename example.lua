local printable_chars = require "printable_chars".printable_chars
local is_char_printable = require "printable_chars".is_char_printable
local set_spaces_allowed = require "printable_chars".set_spaces_allowed

-- printable_chars
-- Char 9 is the TAB
print(printable_chars(string.char(9)))                  -- ""
print(printable_chars(string.char(155)))                -- ""
print(printable_chars("Normal String"))                 -- "Normal String"
print(printable_chars("Tésç123__ \n\n\rsa"))            -- "Ts123__ sa"
print(printable_chars(""))                              -- ""
print(printable_chars(nil))                             -- ""


-- is_char_printable

print(is_char_printable("a"))                           -- true
print(is_char_printable(nil))                           -- nil
print(is_char_printable(string.char(15)))               -- nil
print(is_char_printable("ç"))                           -- nil
print(is_char_printable(string.char(47)))               -- true


-- set_spaces_allowed

set_spaces_allowed()
print(printable_chars("a" .. string.char(9)))           -- "a    "
print(is_char_printable(string.char(9)))                -- true


-- Other usage examples

-- Print random characters from urandom
local urandom = io.open("/dev/urandom", "r")
print(printable_chars(urandom:read(32)))                -- U&0j]s7\]r9\ (Example)
urandom:close()

-- Validate fields
local raw_password = "çç~asdasdasd  \n\n\r\tasdáá"
if raw_password ~= printable_chars(raw_password) then   -- True
    print("Do not use invalid ascii characters in the password")
end
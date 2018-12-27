-- printable_chars.lua
-- Daniel Ribeiro Margarido
-- 2018

-- Default special chars set up to ignore special space types
local space_chars = {
    [9] = false,   -- Tab
    [10] = false, -- \n
    [13] = false, -- \r
}

-- Characters to ignore
local blacklisted_chars = {}

-- Receives a char
-- Returns the true for ascii printable chars, or false otherwise
local function is_char_printable(ch)
    if not ch then
        return nil
    end

    -- Ignore blacklisted chars
    if blacklisted_chars[string.byte(ch)] then
        return false
    end

    return (string.byte(ch) >= 32 and string.byte(ch) <= 126) or space_chars[string.byte(ch)]
end

-- Receives a string
-- Returns string with just the ascii printable characters
local function printable_chars(str)
    local final_string = ""
    if not str then
        return final_string
    end

    for c in str:gmatch(".") do
        if is_char_printable(c) then
            final_string = final_string .. c
        end
    end

    return final_string
end

-- Set the space_chars to return true on special space types
local function set_spaces_allowed()
    space_chars[9] = true
    space_chars[10] = true
    space_chars[13] = true
end

-- Add chars to be ignored (blacklisted chars)
local function blacklist_chars(chars)
    for _, char in ipairs(chars) do
        blacklisted_chars[string.byte(char)] = true
    end
end

return {
    printable_chars = printable_chars,
    is_char_printable = is_char_printable,
    set_spaces_allowed = set_spaces_allowed,
    blacklist_chars = blacklist_chars
}

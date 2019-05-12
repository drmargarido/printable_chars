local set_spaces_allowed = require "printable_chars".set_spaces_allowed
local is_char_printable = require "printable_chars".is_char_printable
local printable_chars = require "printable_chars".printable_chars
local blacklist_chars = require "printable_chars".blacklist_chars

describe("Filter Ascii Chars", function()
    it("detects ascii chars", function()
        assert.is_true(is_char_printable("A"))
        assert.is_true(is_char_printable("a"))
        assert.is_true(is_char_printable(string.char(47)))
        assert.is_true(is_char_printable("z"))
        assert.is_true(is_char_printable("Z"))
    end)

    it("detects non ascii chars", function()
        assert.is.falsy(is_char_printable(nil))
        assert.is.falsy(is_char_printable(string.char(15)))
        assert.is.falsy(is_char_printable("ç"))
        assert.is.falsy(is_char_printable(string.char(1)))
        assert.is.falsy(is_char_printable("ã"))
        assert.is.falsy(is_char_printable(string.char(9))) -- 9 is the TAB
        assert.is.falsy(is_char_printable("\t"))
    end)

    it("filters non ascii data from strings", function()
        assert.same("Normal String", printable_chars("Normal String"))
        assert.same("Ts123__sa", printable_chars("Tésç123__\n\n\rsa"))
        assert.same("prntbleOrNt!", printable_chars("príntäbleOrNót!"))
    end)

    it("behaves well when there is empty results", function()
        assert.same("", printable_chars(string.char(9)))
        assert.same("", printable_chars(string.char(155)))
        assert.same("", printable_chars(""))
        assert.same("", printable_chars(nil))
    end)
end)

describe("Allow filtering configuration", function()
    it("Accepts multiple types of spaces as ascii characters", function()
        set_spaces_allowed()
        assert.is_true(is_char_printable("\r"))
        assert.is_true(is_char_printable("\t"))
        assert.is_true(is_char_printable("\n"))
        assert.same("Ts123__\t\tsa", printable_chars("Tésç123__\t\tsa"))
    end)

    it("Allows blacklisting of specific characters", function()
        blacklist_chars({"?", "!"})
        assert.same("Hey Hello", printable_chars("Hey! Hello?"))
        blacklist_chars({".", "(", ")"})
        assert.same("127001", printable_chars("(127.0.0.1)?"))
    end)
end)

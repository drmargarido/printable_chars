package = "printable_chars"
version = "0.1"
source = {
   url = "https://github.com/drmargarido/printable_chars.git"
}
description = {
   homepage = "https://github.com/drmargarido/printable_chars.git",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      printable_chars = "printable_chars.lua"
   }
}

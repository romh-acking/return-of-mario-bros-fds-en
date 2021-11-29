while true do
gui.text(20, 20, "Register Cursor: ")
gui.text(20, 30, "X: " .. string.format('%02x',memory.readbyte(0x6670)))
gui.text(20, 40, "Y: " .. string.format('%02x',memory.readbyte(0x6671)))
emu.frameadvance()
end
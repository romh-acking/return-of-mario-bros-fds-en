while true do
gui.text(20, 20, "Register Cursor: ")
gui.text(20, 30, "X: " .. string.format('%02x',memory.readbyte(0x666f)))
gui.text(20, 40, "Y: " .. string.format('%02x',memory.readbyte(0x666e)))
emu.frameadvance()
end
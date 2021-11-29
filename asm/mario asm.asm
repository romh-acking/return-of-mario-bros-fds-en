arch nes.cpu

////////////////////////////////////
// Useful cheats
////////////////////////////////////

// Sets score to 555,555
// 0095:55
// 0096:55
// 0097:55

// End a level after a few seconds
// 0045:00

// Combine these codes together to see the congratulatory screens

////////////////////////////////////
// GFX
////////////////////////////////////

org $915e
incbin "asm/chr/koopa font.bin"

org $b180
incbin "asm/chr/menu chr.bin"

org $18b3e
incbin "asm/chr/game over options char.bin"

org $15a0b
incbin "asm/chr/milestone 1 chr.bin"
org $1782d
incbin "asm/chr/milestone 2 chr.bin"

////////////////////////////////////
// Koopa Screen
////////////////////////////////////

//-------------------
// Text alignment
//-------------------

// Single lines on the Koopa Screen
org $22f
nop

// Center text on Koopa screen
org $232
lda #$04

org $1b3
lda #$05

//-------------------
// Text
//-------------------

table "asm/tbl/koopa screen.tbl"
org $638

db $20,$87,$01," "
// Translation: Information about the exciting event of Nagatanien
db $20,$A3,$1a,"   (About the Contest)    "

// Underline
db $20,$C6,$53,$99
db $22,$0A,$83,$78,$7A,$7C
db $22,$0B,$84,$79,$7B,$7D,$7E
db $22,$5C,$88,$52,$62,$54,$64,$56,$66,$58,$68
db $22,$5D,$88,$53,$63,$55,$65,$57,$67,$59,$69
db $22,$7E,$86,$5A,$6A,$5B,$6B,$5C,$6C
db $22,$7F,$86,$5D,$6D,$5E,$6E,$5F,$6F,$23,$40
db $20,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$23,$60,$20,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$23,$80,$20,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$50,$51,$23,$A0,$20,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61
db $FF

////////////////////////////////////
// Disk side switch message Nagatanien
////////////////////////////////////

org $4524
db "SET TO SIDE B",$FF
org $4520
db " "

org $1762E
db "SET TO SIDE A",$FF
org $1762a
db " "

////////////////////////////////////
// Game over menu
////////////////////////////////////

org $172fa
db $21,$6F,$01," "
db $21,$70,$47," "
db $21,$89,$0E,"  Try again   "
db $21,$A9,$4a," "
db $21,$B3,$44," "
db $21,$C9,$0E,"  Title screen"
db $21,$E9,$4E," "
db $22,$09,$0d,"  High scores"
db $22,$16,$01," "

////////////////////////////////////
// High score
////////////////////////////////////

//-------------------
// Translate names
//-------------------

org $1C97D
db "Torya"

org $1C98E
db "Mario"

org $1C99F
db "Imata"

org $1C9B0
db "Mitsu"

org $1C9C1
db "Yoko "

//-------------------
// Pronoun
//-------------------

// Remove second to last character before name that's before score
org $1755e
db "s"

// Remove last character before name that's before score
org $1709C
db "'","'"

// Relocate name and pronoun
org $17552
db $22,$64,$05,$4D,$4D,$4D,$4D,$4D
db $22,$69,$02,$4D,$2C

//-------------------
// Misc text
//-------------------

org $17563
db "score: "

org $175FB
db $22,$C6,$14,"  Push A to go back "

org $175e0
db $22,$C6,$0c,"Save score? "
db $22,$D3,$03,"Yes"
db $23,$13,$02,"No"
db $FF

org $17613
db $21,$4E,$05,"     "
db $21,$6C,$08," SAVING "
db $FF

////////////////////////////////////
// Nagatanien Slots
////////////////////////////////////

org $16A27
db $20,$A9,$01," " //extraneous
db $20,$C6,$14,$D2,"  Push A to stop  ",$D3
db $20,$E6,$01,$D2
db $20,$E7,$52,$4D
db $20,$F9,$01,$D3
db $21,$06,$12,$D2,"    each slot...."
db $21,$15,$45,$4D
db $21,$19,$01,$D3
db $21,$26,$01,$D2
db $21,$27,$52,$4D
db $21,$39,$01,$D3

////////////////////////////////////
// Game over loading
////////////////////////////////////

table "asm/tbl/in-game.tbl"

org $7745
db " LOADING "

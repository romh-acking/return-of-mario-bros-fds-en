arch nes.cpu

////////////////////////////////////
// Register Screen
////////////////////////////////////

//-------------------
// Tiles
//-------------------

table "asm/tbl/koopa screen.tbl"

org $c2c
db $20,$6A,$02,$A0,$A1
db $20,$6C,$48,$A2
db $20,$74,$02,$A3,$A4
db $20,$8A,$0c,$AA," Register ",$AB
db $20,$AA,$02,$A5,$A6
db $20,$AC,$48,$A7
db $20,$B4,$02,$A8,$A9

db $21,$0a,$0c,"Name   ",$3D,$3D,$3D,$3D,$3D
db $21,$4a,$09,"Age    ",$3D,$3D
db $21,$8a,$08,"Gender ",$3D // Change to gender
db $21,$C4,$59,$A2

db $22,$04,$1A,"A B C D E  a b c d e 01234"
db $22,$44,$1A,"F G H I J  f g h i j 56789"
db $22,$84,$16,"K L M N O  k l m n o ",$3e
db $22,$C4,$16,"P Q R S T  p q r s t ",$3f
db $23,$04,$1a,"U V W X Y  u v w x y Luigi"
db $23,$44,$19,"Z          z       - End "

db $20,$00,$60,$4C,$20,$20,$60,$4C,$23,$80,$60,$4C,$23,$A0,$60,$4C,$20,$40,$DA,$4C,$20,$41,$DA,$4C,$20,$42,$DA,$B8,$20,$5E,$DA,$4C,$20,$5F,$DA,$4C

db $21,$64,$05,"Mario"
db $23,$C2,$04,$40,$50,$50,$10
db $23,$CA,$04,$04,$05,$05,$01
db $23,$D9,$46,$50,$23,$DF,$01,$10
db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

//-------------------
// Alphabet character select table
//-------------------
// A table that is read to determine what character to write onscreen
// when pressing 'A' for the name.
org $93C
db "ABCDEabcde"
db "FGHIJfghij"
db "KLMNOklmno"
db "PQRSTpqrst"
db "UVWXYuvwxy"
db "Z    z   -"

//-------------------
// Side option cursor location
//-------------------

org $B87; base $6A4B
// We want to subtract by 1 but the carry flag will always
// be set so subtract by zero.
sbc #$00

//-------------------
// Text displayed after selecting them
//-------------------

org $5F8B; base $ae3e

// Gender options
db $21,$91,$01,$3e,$FF
db $21,$91,$01,$3f,$FF

// When mario is selected
db $21,$64,$05,"Mario"
db $23,$19,$05,"Luigi"
db $FF

// When Luigi is selected
db $21,$64,$05,"Luigi"
db $23,$19,$05,"Mario"
db $FF

// Default empty spaces
db $21,$11,$05,"-----"
db $21,$51,$02,"--"
db $21,$91,$01,"-"
db $FF,$FF,$FF

// repoint female option
org $6E3F
db $43,$ae

// repoint "Mario select text"
org $6E41
db $48,$ae

// repoint "Luigi select text"
org $6E4F
db $59,$ae

//-------------------
// Relocate Mario/Luigi sprite to the right by 8 pixels
//-------------------
org $792; base $6656

db $3F,$B2,$01,$2c
db $3F,$B3,$01,$34
db $47,$B4,$01,$2c
db $47,$B5,$01,$34
db $4F,$B6,$01,$2c
db $4F,$B7,$01,$34

//-------------------
// Relocate top cursor sprite
//-------------------

org $924; base $67e8
db $88,$90,$98,$a0,$a8

//-------------------
// Relocate entry writing to PPU
//-------------------
org $934
// Name
db $11,$12,$13,$14,$15,$16
// Age
db $51,$52

//-------------------
// Change gender writing when loading from save data
//-------------------
org $A8C
db $3e,$3f,"-",$3e,$3f,"-",$3e,$3f

// Limit writing only one character for the gender
org $A4E; fill $0c, $ea

//-------------------
// Prevent cursor change on gender entry
//-------------------
org $BE3; base $6AA7; fill $07, $ea

//-------------------
// Change cursor sizes for the four options to the right
//-------------------
org $B8F; base $6A53; fill $17, $ea
org $B8F; base $6A53
lda $67D3,x
cpy #$04
bne C_Out1
adc #$1f
C_Out1:
cpy #$05
bne C_Out2
adc #$0f
C_Out2:
sta $0207
sta $020F

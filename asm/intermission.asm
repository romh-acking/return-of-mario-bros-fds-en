arch nes.cpu

define GameOption 		$c002
define PointerIndex		$ae95
define PointerHi		$be60
define PointerLo		$be61
define RegistrationAge	$C045

// Freeze this ram address for consistent
// entries: $C033

////////////////////////////////////
// Main functions
////////////////////////////////////

org $644B; base $b2fe; fill $b1, $ea
org $644B; base $b2fe

PrintIntermissionStart: 
jsr $af40
asl
pha

PrintFood:
pla
sta {PointerIndex}
tay
lda $b2b3,y
sta {PointerHi}
iny
lda $b2b3,y
sta {PointerLo}
jmp PrintText

PrintSlogan:

lda {RegistrationAge}
cmp #$07 
bcs IsOverSevenYO

ldy {PointerIndex}
lda $B295,y
sta {PointerHi}
iny
lda $B295,y
sta {PointerLo}
jmp PrintText

IsOverSevenYO: 
cmp #$0D 
bcs PrintSloganDefault

ldy {PointerIndex}
lda $B29F,y
sta {PointerHi}
iny
lda $B29F,y
sta {PointerLo}
jmp PrintText

PrintSloganDefault:

lda {PointerIndex}
tay
lda $b2a9,y
sta {PointerHi}
iny
lda $b2a9,y
sta {PointerLo}
jmp PrintText

PrintPlayer1Name:
lda #$3c
sta {PointerHi}
lda #$c0
sta {PointerLo}
jmp PrintText

PrintPlayer1Honorific:
lda {GameOption}
jsr $b3c5
jmp PrintText

PrintPlayer2Name:
// Check if 2 player, otherwise branch to rts
lda {GameOption}
beq GetOut
lda #$47
sta {PointerHi}
lda #$c0
sta {PointerLo}
jmp PrintText

PrintPlayer2Honorific:
lda {GameOption}
beq GetOut
lda $C051
jsr $B3B1
jmp PrintText

PrintEncouragement:
jsr $af4e
asl
tay
lda $b2bd,y
sta {PointerHi}
iny
lda $b2bd,y
sta {PointerLo}

PrintText:
lda #$01
sta $be63
GetOut:
rts

//-------------------
// ProcessPlayer1Honorific
//-------------------

// Repurpose the honorific to print either "and" or "!"
// to make the sentence grammatically correct for both one player and two player
// Player two's namecard was modified to have an exclamation point.
org $6512; base $b3c5; fill $17, $ea
org $6512; base $b3c5
beq ProcessPlayer1Honorific_OnePlayer
LDA #$2C 
STA {PointerHi}
LDA #$B8 
STA {PointerLo}
JMP ProcessPlayer1Honorific_a

ProcessPlayer1Honorific_OnePlayer: 
LDA #$33
STA {PointerHi}
LDA #$B8
STA {PointerLo}

ProcessPlayer1Honorific_a: 
LDA #$01 
STA $BE63
RTS


////////////////////////////////////
// Repoint
////////////////////////////////////

//-------------------
// Table
//-------------------

org $643D; base $B2F0
db PrintIntermissionStart&$FF,PrintIntermissionStart>>8&$FF
db PrintSlogan&$FF,PrintSlogan>>8&$FF
db PrintEncouragement&$FF,PrintEncouragement>>8&$FF
db PrintPlayer1Name&$FF,PrintPlayer1Name>>8&$FF
db PrintPlayer1Honorific&$FF,PrintPlayer1Honorific>>8&$FF
db PrintPlayer2Name&$FF,PrintPlayer2Name>>8&$FF
db PrintPlayer2Honorific&$FF,PrintPlayer2Honorific>>8&$FF

////////////////////////////////////
// Relocate names
////////////////////////////////////
table "asm/tbl/koopa screen.tbl"

// Amusingly, there's freespace after the namecards.
org $7189
db $21,$a6,"-----",$FF,$FF,$FF,$FF
db $21,$b0,"-----!",$FF,$FF,$FF

////////////////////////////////////
// Honorifics
////////////////////////////////////

org $6979
db $21,$AC,"and",$FF,$FF
db $21,$AB,"!",$FF,$FF

//-------------------
// Relocate 2nd player honorific
//-------------------

org $64FC
db $21,$b4

////////////////////////////////////
// Remove text restrictions
////////////////////////////////////

// So $AE96 controls the time of Mario and Luigi's movments.
// Mario and Luigi's movements are tied to text printing for 
// some reason

// Remove product text restriction
org $60CD
db $08

// Remove Slogan text restriction
org $60bb
db $0f

////////////////////////////////////
// Adjust palette 
////////////////////////////////////

// (2nd and 3rd line) (left)
org $6732; base $B5E5
db $7F

// (2nd and 3rd line) (Right)
org $673A; base $B5ED
db $DF

// (4th line) (left)

org $673D; base $B5F0
db $f7

////////////////////////////////////
// Disk side text
////////////////////////////////////

// Use $4c as the space. This is so the spaces are transparent and don't cover up the sprites when they go behind it.
org $66C7
db "SET",$4c,"TO",$4c,"SIDE B"
org $66C3
db $4c
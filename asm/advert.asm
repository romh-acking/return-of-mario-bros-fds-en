arch nes.cpu

////////////////////////////////////
// GFX
////////////////////////////////////

org $114d
incbin "asm/chr/adverts.bin"
org $C180
incbin "asm/chr/adverts sprites.bin"

////////////////////////////////////
// Mario 3 ad
////////////////////////////////////

// Ad cheat:
// C052:00= SMB3 ad
// C052:01= Ochazuke nori ad
// C052:02= Rice ad

//-------------------
// Relocate Nagatanien sprite text
//-------------------
org $4e26
//Y
//Tile ID
//Orientation / color
//X

db $83,$12,$01,$C0
db $83,$13,$01,$C8
db $83,$ff,$01,$C8 // dummied out
db $8b,$15,$01,$C0
db $8b,$16,$01,$C8
db $93,$17,$01,$C0
db $93,$18,$01,$C8

//-------------------
// Change sign text
//-------------------
// The transition was never changed

table "asm/tbl/smb3 ad.tbl"

org $583D; base $A6F0
db $21,$C6,$8B," !ti sekil "

org $5854; base $A707
db $21,$C4,$8B,"     oiraM "

//-------------------
// Change sign transition
//-------------------

org $5813

db $21,$C6,$8B,$AD,$AE,$AE,$AE,$AD,$AE,$AE,$AE,$AE,$AE,$AD
db $21,$C7,$CB,$AD
db $FF
db $21,$C3,$CB,$AD
db $21,$C4,$8B,$AD,$AD,$AD,$AD,$AD,$AE,$AE,$AE,$AE,$AE,$AD
db $21,$C5,$CB,$AD
db $FF

////////////////////////////////////
// Fried rice advert tilemaps
////////////////////////////////////

//org $4c29; fill $1a5, $ff
org $4c29
db $20,$88,$50,$FE
db $20,$A8,$50,$FE
db $20,$B1,$47,$FE
db $20,$C8,$10,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$fc,$fc,$FE,$FE
db $20,$E8,$10,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$fc,$fc,$FE,$FE
db $21,$08,$10,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4a,$4b,$fc,$fc,$FE,$FE
db $21,$28,$10,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5a,$5b,$fc,$fc,$FE,$FE
db $21,$48,$10,$60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6a,$6b,$fc,$fc,$FE,$FE

db $21,$68,$10,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$fc,$fc,$FE,$FE

db $21,$88,$10,$4d,$4e,$4f,$70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7a,$7b,$FE
db $21,$A8,$10,$5d,$5e,$5f,$80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8a,$8b,$00
db $21,$C8,$10,$6d,$6e,$6f,$2b,$2c,$2d,$2e,$2f,$3b,$3c,$3d,$3e,$90,$91,$92,$01
db $21,$E8,$10,$FE,$FE,$FE,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0F,$10,$11,$12
db $22,$08,$10,$FE,$13,$14,$15,$16,$17,$18,$19,$1A,$1F,$9D,$9E
db $22,$23,$24,$25
db $22,$28,$10,$26,$27,$28,$29,$2A,$30,$31,$32,$33,$34,$9D,$9E,$37,$38,$39,$3A
db $22,$48,$10,$A0,$FD,$A1,$A2,$9B,$9C,$97,$98,$A4,$A5,$9B,$9C,$AA,$AB,$AC,$FF
db $22,$68,$10,$FD,$AD,$AE,$9E,$9D,$9E,$99,$9A,$B4,$B5,$B6,$B7,$B8,$B9,$FF,$FF
db $22,$88,$0B,$FD,$C0,$9B,$9C,$97,$98,$9B,$9C,$9B,$E1,$D2
db $22,$93,$44,$FF
db $22,$97,$01,$E2
db $22,$A8,$10,$D1,$D0,$9D,$9E,$99,$9A,$9D,$9E,$9D,$9E,$9D,$E3,$E4,$E5,$E6,$E7
db $22,$C8,$10,$C1,$E0,$97,$98,$9B,$9C,$97,$98,$9B,$9C,$97,$98,$9B,$9C,$97,$98
db $22,$E8,$10,$FD,$F0,$99,$9A,$9D,$9E,$99,$9A,$9D,$9E,$99,$9A,$9D,$9E,$99,$9A

//-------------------
// Palette
//-------------------

db $23,$C0,$4D,$AA
db $23,$CD,$01,$8A
db $23,$CE,$47,$AA
db $23,$D5,$01,$88 // Nagatanien logo pal
db $23,$D6,$4A,$AA
db $23,$E0,$06,$FF,$FF,$AA,$EA,$AA,$AA
db $23,$E6,$44,$FF
db $23,$EA,$06,$EA,$EB,$EA,$EA,$FF,$FF
db $2F,$F0,$08,$FF,$B0,$A0,$A0,$A0,$F0,$F0,$FF
db $2F,$F8,$48,$0F,$FF


//-------------------
// Nagatanien tilemap
//-------------------
org $5874
db $20,$F4,$84,$B2,$C2,$C4,$D3
db $20,$F5,$84,$B3,$C3,$C5,$D4
db $FF

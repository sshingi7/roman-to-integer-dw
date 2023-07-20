%dw 2.0
output application/json

var romanNumeralMap = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
}

fun romanToInt(romanNumber)=
    do {
        var romanArray =(romanNumber splitBy "")
        ---
        (
            ( 
            (romanNumber splitBy "") map(
                if($$>0 and (romanNumeralMap[romanArray[$$]]>romanNumeralMap[romanArray[$$-1]]))
                    (romanNumeralMap[romanArray[$$]] - 2*(romanNumeralMap[romanArray[$$-1]]))
                else
                    (romanNumeralMap."$")
                )
            ) reduce ($$+$)
        )
    }

---
{
    "Roman to Integer of 3": romanToInt("III"),
    "Roman to Integer of 25": romanToInt("XXV"),
    "Roman to Integer of 42": romanToInt("XLII"),
    "Roman to Integer of 99": romanToInt("XCIX"),
	"Roman to Integer of 888": romanToInt("DCCCLXXXVIII"),
    "Roman to Integer of 994": romanToInt("CMXCIV"),
    "Roman to Integer of 1984": romanToInt("MCMLXXXIV"),
    "Roman to Integer of 2019": romanToInt("MMXIX"),
	"Roman to Integer of 2499": romanToInt("MMCDXCIX"),
    "Roman to Integer of 3999": romanToInt("MMMCMXCIX")
}

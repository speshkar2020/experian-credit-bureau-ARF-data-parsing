%dw 2.0
output application/json

var nameLength = payload[0][7 to 8]
var nameText = payload[0][9 to ((payload[0][7 to 8]) + 8)]
var nameTextIndexEnd = 9 + nameLength
var subSegment = if ((payload[0][(nameTextIndexEnd + 4)] != null) and (payload[0][(nameTextIndexEnd + 4) to (nameTextIndexEnd + 5) ] contains("E1"))) "E1" else ""
---
{
    "segment335": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 6] default "",
        "nameLength": nameLength default "", 
        "nameText":  nameText default "",
        "yearOfBirth": payload[0][nameTextIndexEnd to (nameTextIndexEnd + 3)] default "",
        ("subSegment": {
        "subsegIndicator": subSegment[0 to 1] default "",
       "nameTypeLength": subSegment[2 to 3] default "",
       "nameType": subSegment[4] default ""

        } ) if subSegment != ""
    }
}
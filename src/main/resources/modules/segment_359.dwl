%dw 2.0
output application/json


var subSegmentString = payload[0][26 to (sizeOf(payload[0]) - 1 )] default ""

var subSegIndicator = subSegmentString[0 to 1]
var subSegA9Index = subSegmentString find "A9" reduce ($ ++ $$) default ""
var subSegB6Index = subSegmentString find "B6" reduce ($ ++ $$) default ""

---
{
    "segment359": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 6] default "",
        "inquiryDate": payload[0][7 to 12] default "", 
        "amount":  payload[0][13 to 20] default "",
        "type":  payload[0][21 to 22] default "",
        "terms":  payload[0][23 to 25] default "",
        "substring": subSegmentString,

//Segment A9

("subSegmentA9": {
   "referenceIdSubsegmentIndicator": "A9",
"referenceIdSubsegmentLength": subSegmentString[(subSegA9Index + 2) to (subSegA9Index + 3)],
"accountNumber": subSegmentString[(subSegA9Index + 4) to (subSegmentString[(subSegA9Index + 2) to (subSegA9Index + 3)] + subSegA9Index + 3)] default ""

   }) if subSegA9Index != "",



//Segment B6
   ("subSegmentB6": {
"referenceIdSubsegmentIndicator": "B6",
 "Subcode": subSegmentString [subSegB6Index + 4 to subSegB6Index + 10] default "",
 "kob": subSegmentString [subSegB6Index + 11 to subSegB6Index + 12] default "",
 "subscriberNameLength": subSegmentString [subSegB6Index + 13 to subSegB6Index + 14] default "",
 "subscriberName": subSegmentString[(subSegB6Index + 15) to (subSegmentString [subSegB6Index + 13 to subSegB6Index + 14] + subSegB6Index + 14)] default ""

   }) if subSegB6Index != ""


    }
}
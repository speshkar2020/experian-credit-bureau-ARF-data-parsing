%dw 2.0
output application/json
var sizePayload = sizeOf(payload[0])
---
{
    "segment110": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 6] default "",
        "reportDate": payload[0][7 to 12] default "",
        "reportTime": payload[0][13 to 18] default "",
        "preamble": payload[0][19 to 22] default "",
        "versionNumber": payload[0][23 to 24] default "",
        "keywordLenght": payload[0][25 to 26] default "",
        "keywordText": payload[0][27 to (sizeOf(payload[0]) -1)] default ""

    }
}
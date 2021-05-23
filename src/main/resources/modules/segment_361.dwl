%dw 2.0
output application/json
var sizePayload = sizeOf(payload[0])
---
{
    "segment361": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 6] default "",
        "msgCode": payload[0][7 to 8] default "",
        "textLength": payload[0][9 to 10] default "",
        "msgText": payload[0][11 to (sizeOf(payload[0]) -1)] default ""
    }
}
%dw 2.0
output application/json
var sizePayload = sizeOf(payload[0])
---
{
    "segment322": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 6] default "",
        "ssnIndicator": payload[0][7] default "", //* means SSN is different from input. Blank means its same as input */
       // "ssn": payload[0][9] default "",
        "ssn": payload[0][8 to 16] default ""
        
    }
}
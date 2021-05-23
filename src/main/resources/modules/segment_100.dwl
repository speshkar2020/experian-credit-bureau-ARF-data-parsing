%dw 2.0
output application/json
var sizePayload = sizeOf(payload[0])
---
{
    "segment100": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 5] default "",
        "hostId": payload[0][6] default "",
        "applicationId": payload[0][7] default "",
        "reportDate": payload[0][8 to 13] default "",
        "reportTime": payload[0][14 to 19] default "",
        "reportType": payload[0][20] default "",
        "preamble": payload[0][21 to 24] default "",
        "regionCode": payload[0][25] default "",
        "versionNo": payload[0][26 to 27] default "",
        "surName": trim(payload[0][28 to 37]) default "",
        "firstName": trim(payload[0][38 to 40]) default "",
        "keywordLength": payload[0][41 to 42] default "",
        "keywordText": payload[0][43 to (sizeOf(payload[0]) -1)] default ""
    }
}
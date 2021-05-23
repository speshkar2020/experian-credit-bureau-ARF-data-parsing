%dw 2.0
output application/json

---
{
    "segment950": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 6] default "",
        "totalSeg": payload[0][7 to 9] default "",
        "totalLength": payload[0][10 to 14] default ""
    }
}
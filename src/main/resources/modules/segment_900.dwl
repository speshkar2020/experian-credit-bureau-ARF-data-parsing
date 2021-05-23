%dw 2.0
output application/json

---
{
    "segment900": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 5] default "",
        "totalReportSeg": payload[0][6 to 8] default "",
        "positiveTradeItems": payload[0][9 to 11] default "",
        "nonEvalTradeItems": payload[0][12 to 14] default "",
        "negativeTradeItems": payload[0][15 to 17] default "",
        "nonEvalLegalItems": payload[0][18 to 20] default "",
        "negativeLegalItems": payload[0][21 to 23] default ""
    }
}
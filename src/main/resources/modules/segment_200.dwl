%dw 2.0
output application/json
var sizePayload = sizeOf(payload[0])
---
{
    "segment200": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 5] default "",
        "errorCode": if (payload[0][6 to 8] == "I") "Informative" 
						else if (payload[0][6 to 8] == "C") "Correct and/or Resubmit" 
						else if (payload[0][6 to 8] == "R") "Report Condition or Database Problem" 
						else if (payload[0][6 to 8] == "S") "Suspend"
						else payload[0][6 to 8] default "",
        "actionIndicator": payload[0][9] default "",
        "preamble": payload[0][19 to 22] default ""
        
    }
}
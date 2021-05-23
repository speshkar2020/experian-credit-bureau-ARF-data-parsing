%dw 2.0
output application/json
var sizePayload = sizeOf(payload[0])
var subscriberNameLength = payload[0][24 to 25]
var nameIndexEnd = subscriberNameLength + 25
var addressLength = payload[0][(nameIndexEnd + 1) to (nameIndexEnd + 2)]
var addressIndexEnd = nameIndexEnd + 2 + addressLength
var cityLength = payload[0][addressIndexEnd + 1  to addressIndexEnd + 2] 
var cityIndexEnd = addressIndexEnd + 2 + cityLength
---
{
    "segment370": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 6] default "",
        "subscriberNo": payload[0][7 to 13] default "",
        "subscriberPhone": payload[0][14 to 23] default "",
        "subscriberNameLength": subscriberNameLength default "",
        "subscriberName": payload[0][26 to (subscriberNameLength + 25)] default "",
        "addressLength": addressLength default "",
        "address": payload[0][(nameIndexEnd + 3 ) to addressIndexEnd] default "",
        "cityLength": cityLength default "",
        "city": payload[0][(addressIndexEnd + 3 ) to cityIndexEnd] default "",
        "state": payload[0][cityIndexEnd + 1 to cityIndexEnd + 2] default "",
        "zipCode": payload[0][cityIndexEnd + 3 to (sizeOf(payload[0]) -1)] default ""
    }
}
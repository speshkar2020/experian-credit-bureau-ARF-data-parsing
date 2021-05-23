%dw 2.0
output application/json

var consumerCommentLength = payload[0][24 to 27]
var consumerCommentText =  payload[0][28 to (consumerCommentLength + 27)] 
var commenttextEndIndex = (28 + consumerCommentLength)
var subSegmentString = payload[0][(commenttextEndIndex) to (sizeOf(payload[0]) - 1 )] default ""


var subSegA6Index = subSegmentString find "A6" reduce ($ ++ $$) default ""
var subSegA7Index = subSegmentString find "A7" reduce ($ ++ $$) default ""
var subSegY2Index = subSegmentString find "Y2" reduce ($ ++ $$) default ""
var subSegE5Index = subSegmentString find "E5" reduce ($ ++ $$) default ""

var courtNameLengthA6 = payload[0][(commenttextEndIndex + 11) to (commenttextEndIndex + 12)]
---
{
    "segment350": {
        "recordId": payload[0][0 to 2] default "",
        //"recordLength": payload[0][3 to 6] default "",
        "status": payload[0][7 to 8] default "", 
        "evaluation":  payload[0][9] default "",
        "statusDate":  payload[0][10 to 15] default "",
        "amount":  payload[0][16 to 23] default "",
        //"consumerCommentLength":  consumerCommentLength default "",
        "consumerCommentText":  if (consumerCommentLength != "0000") consumerCommentText else "" default "",
        "subSegmentString": subSegmentString,
        "subSegA6Index": subSegA6Index,
        "subSegA7Index": subSegA7Index,
        "subSegY2Index": subSegY2Index,
        "subSegE5Index": subSegE5Index,
        ("subSegmentA6": {
            //"courtNameSubsegIndicator": subSegmentString[subSegA6Index to (subSegA6Index + 1)],
            //"courtNameLength": subSegmentString[(subSegA6Index + 2) to (subSegA6Index + 3)],
            "courtCode": subSegmentString[(subSegA6Index + 4) to (subSegA6Index + 10)],
            //"courtNameLength": subSegmentString[(subSegA6Index + 11) to (subSegA6Index + 12)] default "",
           "courtName": subSegmentString[subSegA6Index + 13 to (subSegmentString[(subSegA6Index + 11) to subSegA6Index + 12] + 12)] default ""

      }) if subSegA6Index != "",

      ("subSegmentA7": {
            //"referenceNumberSubsegIndicator": subSegmentString[subSegA7Index to (subSegA7Index + 1)] default "",
            //"refNumberLength": subSegmentString[(subSegA7Index + 2 to subSegA7Index + 3)] default "" ,
            "referenceNumber": subSegmentString[(subSegA7Index + 4) to (subSegA7Index + (subSegmentString[(subSegA7Index + 2 to subSegA7Index + 3)] - 1))] default ""

      }) if subSegA7Index != "",

      ("subSegmentE5": {
            //"bookPageSubsegIndicator": subSegmentString[subSegE5Index to (subSegE5Index + 1)] default "",
            //"bookPageSubsegLength": subSegmentString[(subSegE5Index + 2 to subSegE5Index + 3)] default "" ,
            "pageNumber": subSegmentString[(subSegE5Index + 4) to (subSegE5Index + (subSegmentString[(subSegE5Index + 2 to subSegE5Index + 3)] - 1))] default ""

      }) if subSegE5Index != "",

      ("subSegmentY2": {
            //"origFilingDateSubsegIndicator": subSegmentString[subSegY2Index to (subSegY2Index + 1)] default "",
            //"originalFilingDateLength": subSegmentString[(subSegY2Index + 2 to subSegY2Index + 3)] default "" ,
            "originalFilingDate": subSegmentString[(subSegY2Index + 4) to (subSegY2Index + 9)] default ""

      }) if subSegY2Index != ""
    }
}
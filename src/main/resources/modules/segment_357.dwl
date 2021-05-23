%dw 2.0
output application/json
import isNumeric from dw::core::Strings

var consumerCommentLength = payload[0][74 to 77]
var consumerCommentText =  payload[0][78 to (consumerCommentLength + 77)] 
var commenttextEndIndex = (78 + consumerCommentLength)
var subSegmentString = payload[0][(commenttextEndIndex) to (sizeOf(payload[0]) - 1 )] default ""

var subSegIndicator = subSegmentString[0 to 1]

var subSegA9Index = subSegmentString find "A9" reduce ($ ++ $$) default ""
var subSegB2Index = subSegmentString find "B2" reduce ($ ++ $$) default ""
var subSegB4Index = subSegmentString find "B4" reduce ($ ++ $$) default ""
var subSegB5Index = subSegmentString find "B5" reduce ($ ++ $$) default ""
var subSegB6Index = subSegmentString find "B6" reduce ($ ++ $$) default ""
var subSegB7Index = subSegmentString find "B7" reduce ($ ++ $$) default ""
var subSegB9Index = subSegmentString find "B9" reduce ($ ++ $$) default ""
var subSegF2Index = subSegmentString find "F2" reduce ($ ++ $$) default ""
var subSegF3Index = subSegmentString find "F3" reduce ($ ++ $$) default ""

---
{
    "segment357": {
        "recordId": payload[0][0 to 2] default "",
        "recordLength": payload[0][3 to 6] default "",
        "specialCommentCode": payload[0][7 to 8] default "", 
        "evaluation":  payload[0][9] default "",
        "dateOpen":  payload[0][10 to 13] default "",
        "statusDate":  payload[0][14 to 17] default "",
        "maximumDelinquencyDate":  payload[0][18 to 21] default "",
        "typeCode":  payload[0][22 to 23] default "",
        "terms": payload[0][24 to 26] default "",
        "ecoa": payload[0][27] default "",
        "amount1": payload[0][28 to 35] default "",
        "amount1Qualifier": payload[0][36] default "",
        "amount2": payload[0][37 to 44] default "",
        "amount2Qualifier":  payload[0][45] default "",
        "balanceDate":  payload[0][46 to 51] default "",
        "balanceAmount":  payload[0][52 to 59] default "",
        "status":  payload[0][60 to 61] default "",
        "reserved": payload[0][62 to 63] default "",
        "amountPastDue": payload[0][64 to 71] default "",
        "openOrclosed": payload[0][72] default "",
        "RevorInstall": payload[0][73] default "",
        "consumerCommentLength": consumerCommentLength default "",
        "consumerComment": if (consumerCommentLength != "0000") consumerCommentText else "" default "",
        "subSegmentString": subSegmentString,

//Segment A9

("subSegmentA9": {
   "referenceIdSubsegmentIndicator": "A9",
"referenceIdSubsegmentLength": subSegmentString[(subSegA9Index + 2) to (subSegA9Index + 3)],
"accountNumber": subSegmentString[(subSegA9Index + 4) to (subSegmentString[(subSegA9Index + 2) to (subSegA9Index + 3)] + subSegA9Index + 3)] default ""

   }) if subSegA9Index != "",

//Segment B2
("subSegmentB2": {
   "referenceIdSubsegmentIndicator": "B2",
"paymentCounterSubsegmentLength": subSegmentString[(subSegB2Index + 2) to (subSegB2Index + 3)],
"monthsReviewed": subSegmentString[(subSegB2Index + 4) to (subSegB2Index + 5)] default "",
"30dayCounter": subSegmentString[(subSegB2Index + 6) to (subSegB2Index + 7)] default "",
"60dayCounter": subSegmentString[(subSegB2Index + 8) to (subSegB2Index + 9)] default "",
"90dayCounter": subSegmentString[(subSegB2Index + 10) to (subSegB2Index + 11)] default ""

   }) if subSegB2Index != "",

//Segment B4
("subSegmentB4": {
"referenceIdSubsegmentIndicator": "B4",
 "paymentProfile": subSegmentString [subSegB4Index + 4 to (subSegmentString[(subSegB4Index + 2) to (subSegB4Index + 3)] + subSegB4Index + 3 )] default ""

   }) if subSegB4Index != "",

//Segment B5

("subSegmentB5": {
"referenceIdSubsegmentIndicator": "B5",
 "monthlyPaymentLength": subSegmentString[subSegB5Index + 2 to subSegB5Index + 3] default "",
 "monthlyPaymentAmount": subSegmentString[subSegB5Index + 4 to subSegB5Index + 11] default "",
 "Monthly Payment Type": subSegmentString[subSegB5Index + 12] default "",
 "Frequency": subSegmentString[subSegB5Index + 13] default "",

   }) if subSegB5Index != "",

//Segment B6
   ("subSegmentB6": {
"referenceIdSubsegmentIndicator": "B6",
 "Subcode": subSegmentString [subSegB6Index + 4 to subSegB6Index + 10] default "",
 "kob": subSegmentString [subSegB6Index + 11 to subSegB6Index + 12] default "",
 "subscriberNameLength": subSegmentString [subSegB6Index + 13 to subSegB6Index + 14] default "",
 "subscriberName": subSegmentString[(subSegB6Index + 15) to (subSegmentString [subSegB6Index + 13 to subSegB6Index + 14] + subSegB6Index + 14)] default ""

   }) if subSegB6Index != "",

//Segment B7
   ("subSegmentB7": {
"referenceIdSubsegmentIndicator": "B7",
 "originalCreditor": subSegmentString[(subSegB7Index + 4) to (subSegmentString [subSegB7Index + 2 to subSegB7Index + 3] + (subSegB7Index + 3))] default ""

   }) if subSegB7Index != "",

//Segment B9
   ("subSegmentB9": {
"referenceIdSubsegmentIndicator": "B9",
 "paymentProfile": if(isNumeric(subSegmentString [subSegB9Index + 2 to subSegB9Index + 3])) subSegmentString[(subSegB9Index + 4) to (subSegmentString [subSegB9Index + 2 to subSegB9Index + 3] + subSegB9Index + 3)] else ""

   }) if subSegB9Index != "",


//Segment F2

   ("subSegmentF2": {
"referenceIdSubsegmentIndicator": "F2",
 "delinquencyDates_PaymentCodeLength": subSegmentString[subSegF2Index + 2 to subSegF2Index + 3] default "",
 "maximumPaymentCode": subSegmentString[subSegF2Index + 4] default "",
 "firstDelinquencyDate": subSegmentString subSegmentString[subSegF2Index + 5 to subSegF2Index + 8] default "",
 "secondDelinquencyDate": subSegmentString[subSegF2Index + 9 to subSegF2Index + 12] default "",

   }) if subSegF2Index != "",

//Segment F3

   ("subSegmentF3": {
"referenceIdSubsegmentIndicator": "F3",
"initialPaymentLevelDate": subSegmentString[subSegF3Index + 4 to subSegF3Index + 7] default "",
 "accountConditionCode": subSegmentString[subSegF3Index + 8 to subSegF3Index + 9] default "",
 "enhancedPaymentStatus":  subSegmentString[subSegF3Index + 10 to subSegF3Index + 11] default "",
 "enhancedTypeCodes": subSegmentString[subSegF3Index + 12 to subSegF3Index + 13] default "",
 "enhancedSpecialComments": subSegmentString[subSegF3Index + 14 to subSegF3Index + 15] default ""

   }) if subSegF3Index != ""
    }
}
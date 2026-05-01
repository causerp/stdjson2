package stdjson

import std.collection.{enumerate, HashMap}

// cjlint-ignore -start !G.NAM.04 function names should be lower camel case

@Test
class TestRapidJsonValue {
    let mainJson = #"
    {
        "id": 9007199254740993,
        "source": "RapidJSON & test",
        "active": true,
        "price": 19.95,
        "tags": ["native", "fast", "safe"],
        "profile": {
            "username": "cj_user",
            "verified": false,
            "score": 100,
            "permissions": []
        },
        "nullable": null,
        "emptyString": "",
        "emptyArray": [],
        "emptyObject": {},
        "mixedNumbers": [
            -1,
            -2147483648,
            42,
            2147483648,
            9223372036854775807,
            -9223372036854775808,
            3.14,
            "not_a_number",
            true
        ]
    }
    "#

    @TestCase
    func test_parse() {
        let value = JsonValue.fromStr(mainJson)

        match (value.kind()) {
            case JsObject => ()
            case _ => @Fail("Expected JsObject")
        }

        let obj = value.asObject()

        match (obj["id"].kind()) {
            case JsInt => ()
            case _ => @Fail("Expected JsInt")
        }
        match (obj["source"].kind()) {
            case JsString => ()
            case _ => @Fail("Expected JsString")
        }
        match (obj["active"].kind()) {
            case JsBool => ()
            case _ => @Fail("Expected JsBool")
        }
        match (obj["price"].kind()) {
            case JsDouble => ()
            case _ => @Fail("Expected JsDouble")
        }
        match (obj["tags"].kind()) {
            case JsArray => ()
            case _ => @Fail("Expected JsArray")
        }
        match (obj["profile"].kind()) {
            case JsObject => ()
            case _ => @Fail("Expected JsObject")
        }
        match (obj["nullable"].kind()) {
            case JsNull => ()
            case _ => @Fail("Expected JsNull")
        }
    }

    @TestCase
    func test_toString() {
        let value = JsonValue.fromStr(mainJson)

        match (value.kind()) {
            case JsObject => ()
            case _ => @Fail("Expected JsObject")
        }

        let obj = value.asObject()

        @Expect(obj["id"].toString(), "9007199254740993")
        @Expect(obj["source"].toString(), #""RapidJSON \u0026 test""#)
        @Expect(obj["active"].toString(), "true")
        @Expect(obj["price"].toString(), "19.950000")
        @Expect(obj["tags"].toString(), #"["native","fast","safe"]"#)
        @Expect(obj["profile"].toString(), #"{"username":"cj_user","verified":false,"score":100,"permissions":[]}"#)
        @Expect(obj["nullable"].toString(), "null")
    }

    @TestCase
    func test_toStringWithoutEscaping() {
        let value = JsonValue.fromStr(mainJson)

        match (value.kind()) {
            case JsObject => ()
            case _ => @Fail("Expected JsObject")
        }

        let obj = value.asObject()

        @Expect(obj["id"].toStringWithoutEscaping(), "9007199254740993")
        @Expect(obj["source"].toStringWithoutEscaping(), #""RapidJSON & test""#)
        @Expect(obj["active"].toStringWithoutEscaping(), "true")
        @Expect(obj["price"].toStringWithoutEscaping(), "19.950000")
        @Expect(obj["tags"].toStringWithoutEscaping(), #"["native","fast","safe"]"#)
        @Expect(obj["profile"].toStringWithoutEscaping(), #"{"username":"cj_user","verified":false,"score":100,"permissions":[]}"#)
        @Expect(obj["nullable"].toStringWithoutEscaping(), "null")
    }

    @TestCase
    func test_toJsonString() {
        let value = JsonValue.fromStr(mainJson)

        match (value.kind()) {
            case JsObject => ()
            case _ => @Fail("Expected JsObject")
        }

        let obj = value.asObject()

        @Expect(obj["id"].toJsonString(), "9007199254740993")
        @Expect(obj["source"].toJsonString(), #""RapidJSON \u0026 test""#)
        @Expect(obj["active"].toJsonString(), "true")
        @Expect(obj["price"].toJsonString(), "19.950000")
        @Expect(obj["tags"].toJsonString(), #"[
  "native",
  "fast",
  "safe"
]"#)
        @Expect(obj["profile"].toJsonString(), #"{
  "username": "cj_user",
  "verified": false,
  "score": 100,
  "permissions": []
}"#)
        @Expect(obj["nullable"].toJsonString(), "null")
    }

    @TestCase
    func test_toJsonStringWithoutEscaping() {
        let value = JsonValue.fromStr(mainJson)

        match (value.kind()) {
            case JsObject => ()
            case _ => @Fail("Expected JsObject")
        }

        let obj = value.asObject()

        @Expect(obj["id"].toJsonStringWithoutEscaping(), "9007199254740993")
        @Expect(obj["source"].toJsonStringWithoutEscaping(), #""RapidJSON & test""#)
        @Expect(obj["active"].toJsonStringWithoutEscaping(), "true")
        @Expect(obj["price"].toJsonStringWithoutEscaping(), "19.950000")
        @Expect(obj["tags"].toJsonStringWithoutEscaping(), #"[
  "native",
  "fast",
  "safe"
]"#)
        @Expect(obj["profile"].toJsonStringWithoutEscaping(), #"{
  "username": "cj_user",
  "verified": false,
  "score": 100,
  "permissions": []
}"#)
        @Expect(obj["nullable"].toJsonStringWithoutEscaping(), "null")
    }
}

// cjlint-ignore -end function names should be lower camel case

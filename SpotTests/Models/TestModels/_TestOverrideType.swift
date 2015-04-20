/************************************************

            MACHINE GENERATED FILE

 ************************************************/

import Spot

public struct TestOverrideType {
    var myArrayOfString: [String]?
    var myURL: NSURL?

public init(myArrayOfString: [String]?, myURL: NSURL?) {

    self.myArrayOfString = myArrayOfString
    self.myURL = myURL

    }
}

extension TestOverrideType : Decodable {

    static func create(myArrayOfString: [String]?)(myURL: NSURL?) -> TestOverrideType  {

        return TestOverrideType(myArrayOfString: myArrayOfString, myURL: myURL)
    }
    public init?(decoder: Decoder) {
        let instance: TestOverrideType? = TestOverrideType.create
        <^> Optional(decoder.decode("myArrayOfString"))
        <*> Optional(decoder.decode("myURL"))

        if let i = instance { self = i } else { return nil }
    }
}

extension TestOverrideType : Encodable {

    public func encode(encoder: Encoder) {
        encoder.encode(self.myArrayOfString, forKey: "myArrayOfString")
        encoder.encode(self.myURL, forKey: "myURL")

    }
}


public protocol Encodable {
    func encode(encoder: Encoder)
    func willFinishEncodingWithEncoder(encoder: Encoder)
}

public extension Encodable {
    
    func encode() -> [String : AnyObject] {
        let coder = Encoder()
        self.encode(coder)
        return coder.data
    }
    
    func encodeToFile(converter: KeyedConverter.Type, path: String) {
        converter.write(self.encode(), path: path)
    }
    
    /**
     encoding will finish on the receiver
     - parameter encoder: the encoder used for encoding
     
     :Discussion: This method is called right before encoding finishes.
     It provides a chance to encode any further data with the encoder.
     */
    func willFinishEncodingWithEncoder(encoder: Encoder) {
        
    }

}

public final class Encoder {
    public var data = [String : AnyObject]()
    
    public func encode<T: Encodable>(value: T?, _ key: String) {
        value.apply { self.data[key] = $0.encode() }
    }
    
    public  func encode<T: Encodable>(value: [T]?, _ key: String) {
        value.apply { self.data[key] = $0.map { $0.encode() } }
    }
    
    public func encode<T: Encodable>(value: [String : T]?, _ key: String) {
        value.apply { self.data[key] = $0.map { $0.encode() } }
    }
    
    public func encode<V>(value: V?, _ key: String) {
        value.apply{ self.data[key] = $0 as? AnyObject }
    }
}
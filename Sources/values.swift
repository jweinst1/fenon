//file that contains the XenonValue, for dynamic and streamable typing
//The XenonValue represents value types

enum XenonValue:CustomStringConvertible, Hashable {
    //types of values
    case int(Int)
    case str(String)
    case bool(Bool)
    indirect case list([XenonValue])
    indirect case map([XenonValue:XenonValue])
    indirect case set(Set<XenonValue>)
    case null
    
    //for printing, hasing, and equating
    var description: String {
        switch self {
        case .int(let value):
            return String(value)
        case .str(let value):
            return "\"\(value)\""
        case .bool(let value):
            return String(value)
        case .list(let lst):
            return String(describing: lst)
        case .map(let map):
            return String(describing: map)
        case .set(let set):
            return String(describing: set)
        case .null:
            return "null"
        }
    }
    
    var hashValue: Int {
        return self.description.hashValue
    }
    
    init(value:Int) {
        self = .int(value)
    }
    
    init(value:String) {
        self = .str(value)
    }
    
    init(value:Bool) {
        self = .bool(value)
    }
    //null initializer
    init() {
        self = .null
    }
    
    init(value:[XenonValue]) {
        self = .list(value)
    }
    
    init(value:Set<XenonValue>) {
        self = .set(value)
    }
    
    init(value:[XenonValue:XenonValue]) {
        self = .map(value)
    }
    
    var int: Int{
        switch self {
        case .int(let val):
            return val
        default:
            return 0
        }
    }
}


extension XenonValue:Equatable {
    static func ==(x:XenonValue, y:XenonValue) -> Bool {
        return x.hashValue == y.hashValue
    }
}


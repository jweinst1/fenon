class Env {
    var defs:[String:XenonValue]
    var parent:Env?
    var stack:[XenonValue]
    
    //checks if current env is global
    var isRoot: Bool {
        return self.parent == nil
    }
    //gets top item on stack
    var firstStackItem: XenonValue? {
        return self.stack.first
    }
    
    //global env initializer
    init(){
        self.defs = [String:XenonValue]()
        self.stack = [XenonValue]()
    }
    
    //local env initializer
    init(args:Env) {
        self.parent = args
        self.defs = [String:XenonValue]()
        self.stack = [XenonValue]()
    }
    
    //returns a new Env that's linked to the env that calls this method
    func clone() -> Env {
        return Env(args:self)
    }
    
    //getter method that checks local env, then goes up in parent branch
    func get(index:String) -> XenonValue? {
        if let val = self.defs[index] {
            return val
        }
        else {
            if self.parent != nil {
                return self.parent!.get(index:index)
            }
            else {
                return nil
            }
        }
    }
    //basic setter method
    func set(index:String, val:XenonValue) -> Void {
        self.defs[index] = val
    }
    
    //pushes to stack
    func push(item:XenonValue) -> Void {
        self.stack.append(item)
    }
    //pops from stack
    func pop() -> XenonValue? {
        return self.stack.popLast()
    }
    //checks if a key is present
    func contains(index:String) -> Bool {
        return self.defs[index] != nil
    }
    
    //updats the environment based on incoming dictionaries of OblVals
    func update(dict:[String:XenonValue]) -> Void {
        for (key, value) in dict {
            self.defs[key] = value
        }
    }
    //initalizes an empty variable assigned to null.
    func InitNull(index:String) -> Void {
        self.defs[index] = XenonValue.null
    }
}




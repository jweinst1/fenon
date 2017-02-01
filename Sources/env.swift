class Env {
    var defs:[String:XenonValue]
    var parent:Env?
    
    //checks if current env is global
    var isRoot: Bool {
        return self.parent == nil
    }
    
    //global env initializer
    init(){
        self.defs = [String:XenonValue]()
    }
    
    //local env initializer
    init(args:Env) {
        self.parent = args
        self.defs = [String:XenonValue]()
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

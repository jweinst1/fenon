
let path = CommandLine.arguments[1]
print(textToXML(text:readFromFile(location: path)!).children[0].children[0].element!.allAttributes["name"]!.text)

/*let path = CommandLine.arguments[1]
print(textToXML(text:readFromFile(location: path)!).children[0].children[0].element!.allAttributes["name"]!.text)
 
 
 
 print(textToXML(text:readFromFile(location: path)!).children[0].element!.name)
 
 */




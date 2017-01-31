
let path = CommandLine.arguments[1]
print(textToXML(text:readFromFile(location: path)!).children[0].element!.name)



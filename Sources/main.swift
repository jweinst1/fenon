let xmlToParse = "<program><print><int>5</int><string>hello</string></print></program>"

let xml = SWXMLHash.parse(xmlToParse)
print(xml["program"].children)
print(xml["program"].children[0].children)
print(xml["program"].children[0].children[0].element!.text!)

/*[<print><int>5</int><string>hello</string></print>]
 [<int>5</int>, <string>hello</string>]
 5*/

/*
 File that implements the functions to read xenon files from CMD args and parse from xml format
 */

import Foundation

//reads text utf-8 encoded from file
func readFromFile(location:String) -> String? {
    do {
        return try String(contentsOfFile: location, encoding: String.Encoding.utf8)
    } catch {
        return nil
    }
}

//parses text to an XML tree object
func textToXML(text:String) -> XMLIndexer {
    return SWXMLHash.parse(text)
}

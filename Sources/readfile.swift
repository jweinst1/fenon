/*
 File that implements the readng of xenon files from CMD args
 */

import Foundation

func readFromFile(location:String) -> XMLIndexer? {
    if let filepath = Bundle.main.path(forResource: location, ofType: "txt") {
        do {
            let contents = try String(contentsOfFile: filepath)
            print(contents)
            return SWXMLHash.parse(contents)
        } catch {
            //needs specific error
            print("Error Invalid Xenon File")
            return nil
        }
    } else {
        //needs specific error
       print("Xenon file \(location) does not exist.")
        return nil
    }
}

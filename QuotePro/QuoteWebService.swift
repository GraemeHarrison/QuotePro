//
//  QuoteWebService.swift
//  QuotePro
//
//  Created by Graeme Harrison on 2016-02-17.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import Foundation

class QuoteWebService {
    
    var quotesArray = [String]()
    
    func callAPI(completionHandler: (String?, String?) -> Void) {
        
        //MARK: - REST calls
        // This makes the GET call to httpbin.org. It simply gets the IP address and displays it on the screen.
            
            // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
            let postEndpoint: String = "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
            let session = NSURLSession.sharedSession()
            let url = NSURL(string: postEndpoint)!
            
            // Make the POST call and handle it in a completion handler
            session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                // Make sure we get an OK response
                guard let realResponse = response as? NSHTTPURLResponse where
                    realResponse.statusCode == 200 else {
                        print("Not a 200 response")
                        return
                }
                
                // Read the JSON
                do {
                    if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                        // Print what we got from the call
                        print(ipString)
                        
                        // Parse the JSON to get the IP
                        let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                        let quote = jsonDictionary["quoteText"] as! String
                        let author = jsonDictionary["quoteAuthor"] as! String
                        
//                        self.quotesArray.append(quoteText)
                        print("quoteText: \(quote)")
                        print("quoteAuthor: \(author)")
//                        print("quotesArray: \(self.quotesArray)")
                        
//                        completionHandler(quote, author)
                        
//                         Update label or save data, etc.
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            completionHandler(quote, author)
                        })
                    }
                    
                } catch {
                    print("bad things happened")
                }
            }).resume()
    }
}

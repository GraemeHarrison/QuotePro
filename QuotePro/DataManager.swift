//
//  DataManager.swift
//  QuotePro
//
//  Created by Graeme Harrison on 2016-02-17.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import Foundation
import CoreData
import UIKit

private let instance = DataManager()

class DataManager {
    
    class var sharedInstance : DataManager {
        return instance
    }
    
    var managedObjectContext: NSManagedObjectContext? = nil

    init() {
        let appDelegate : AppDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
        self.managedObjectContext = appDelegate.managedObjectContext
    }
    
    func saveData(quote: String, author: String, picURL: String) {
        let quoteObject = NSEntityDescription.insertNewObjectForEntityForName("Quote",
            inManagedObjectContext: self.managedObjectContext!) as! Quote
        quoteObject.quote = quote
        quoteObject.author = author
        quoteObject.photoURL = picURL
        
        do {
            try self.managedObjectContext!.save()
            print("The quote is: \(quoteObject.quote)")
            
        } catch {
            print("Unresolved error")
            abort()
        }
    }
    
    func fetchData() ->[Quote] {
        let moc = self.managedObjectContext
        let quoteFetch = NSFetchRequest(entityName: "Quote")
        
        do {
            var quotesArray = [Quote]()
            quotesArray = try moc!.executeFetchRequest(quoteFetch) as! [Quote]
            return quotesArray
            
        } catch {
            fatalError("Failed to fetch quotes: \(error)")
        }
    }
}
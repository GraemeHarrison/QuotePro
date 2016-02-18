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
            print("The name is: \(quoteObject.quote)")
            
        } catch {
            print("Unresolved error")
            abort()
        }
    }
    class var sharedInstance : DataManager {
        return instance
    }
}
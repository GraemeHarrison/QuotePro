//
//  Quote+CoreDataProperties.swift
//  QuotePro
//
//  Created by Graeme Harrison on 2016-02-17.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Quote {

    @NSManaged var personName: String?
    @NSManaged var quoteString: String?
    @NSManaged var photo: Photo?

}

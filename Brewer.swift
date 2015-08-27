//
//  Brewer.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 11/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import Foundation
import CoreData

class Brewer: NSManagedObject {

    @NSManaged var brewerName: String
    @NSManaged var brewerAddress: String?
    @NSManaged var brewerLocation: String?
    @NSManaged var brewerDescription: String?
    @NSManaged var brewerPhoneNumber: String?
    @NSManaged var brewerImage: String?

    class func createInManagedObjectContext(moc: NSManagedObjectContext, brewerName: String, brewerAddress: String, brewerLocation: String, brewerDescription: String, brewerPhoneNumber: String, brewerImage: String) -> Brewer {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Brewer", inManagedObjectContext: moc) as! Brewer
        newItem.brewerName = brewerName
        newItem.brewerAddress = brewerAddress
        newItem.brewerLocation = brewerLocation
        newItem.brewerDescription = brewerAddress
        newItem.brewerPhoneNumber = brewerPhoneNumber
        newItem.brewerImage = brewerImage
        return newItem
    }
    
}

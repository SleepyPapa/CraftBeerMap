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
    @NSManaged var brewerAddress: String
    @NSManaged var brewerLocation: NSNumber
    @NSManaged var brewerDescription: String
    @NSManaged var brewerPhoneNumber: String
    @NSManaged var brewerImage: String

}

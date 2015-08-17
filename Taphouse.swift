//
//  Taphouse.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 11/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import Foundation
import CoreData

class Taphouse: NSManagedObject {

    @NSManaged var taphouseName: String
    @NSManaged var taphouseLocation: String
    @NSManaged var taphouseDescription: String
    @NSManaged var taphouseImage: String
    @NSManaged var taphousePhoneNumber: String

}

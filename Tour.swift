//
//  Tour.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 11/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import Foundation
import CoreData

class Tour: NSManagedObject {

    @NSManaged var tourName: String
    @NSManaged var tourImage: String
    @NSManaged var tourDescription: String
    @NSManaged var tourPhoneNumber: String
    @NSManaged var tourLocation: String

}

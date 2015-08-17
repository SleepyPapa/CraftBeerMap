//
//  Beer.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 11/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import Foundation
import CoreData

//@objc(Beer)
class Beer: NSManagedObject {

    @NSManaged var beerName: String
    @NSManaged var brewerName: String
    @NSManaged var beerDescription: String
    @NSManaged var beerLabel: String

}

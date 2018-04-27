//
//  Child+CoreDataProperties.swift
//  molfar.test
//
//  Created by ios.nomad on 4/27/18.
//  Copyright © 2018 ios.nomad. All rights reserved.
//
//

import Foundation
import CoreData


extension Child {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Child> {
        return NSFetchRequest<Child>(entityName: "Child")
    }

    @NSManaged public var id: String?
    @NSManaged public var parent: Parent?

}

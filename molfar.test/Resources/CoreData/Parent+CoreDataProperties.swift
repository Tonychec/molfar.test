//
//  Parent+CoreDataProperties.swift
//  molfar.test
//
//  Created by ios.nomad on 4/27/18.
//  Copyright © 2018 ios.nomad. All rights reserved.
//
//

import Foundation
import CoreData


extension Parent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Parent> {
        return NSFetchRequest<Parent>(entityName: "Parent")
    }

    @NSManaged public var name: String?
    @NSManaged public var childs: NSSet?

}

// MARK: Generated accessors for childs
extension Parent {

    @objc(addChildsObject:)
    @NSManaged public func addToChilds(_ value: Child)

    @objc(removeChildsObject:)
    @NSManaged public func removeFromChilds(_ value: Child)

    @objc(addChilds:)
    @NSManaged public func addToChilds(_ values: NSSet)

    @objc(removeChilds:)
    @NSManaged public func removeFromChilds(_ values: NSSet)

}

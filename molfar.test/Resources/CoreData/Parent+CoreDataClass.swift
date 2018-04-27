//
//  Parent+CoreDataClass.swift
//  molfar.test
//
//  Created by ios.nomad on 4/27/18.
//  Copyright © 2018 ios.nomad. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Parent)
public class Parent: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Parent"), insertInto: CoreDataManager.instance.getManagedContext())
    }
}

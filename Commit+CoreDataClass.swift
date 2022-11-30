//
//  Commit+CoreDataClass.swift
//  Project38
//
//  Created by Grant Watson on 11/29/22.
//
//

import Foundation
import CoreData

@objc(Commit)
public class Commit: NSManagedObject {
    override public init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
}

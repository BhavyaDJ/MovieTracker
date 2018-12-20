//
//  Person+Extension.swift
//  MovieTracker
//
//  Copyright © 2018 Bhavya D J. All rights reserved.
//
import Foundation
import CoreData

extension Person {
    
    convenience init(data: [String: Any], category: String, insertInto context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)!
        self.init(entity: entity, insertInto: context)
        
        name = (data["name"] as! String)
        imageUrl = (data["profile_path"] as? String)
        popularity = (data["popularity"] as! Double)
        
        self.category = category
    }

}

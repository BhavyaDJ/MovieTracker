//
//  Tv+Extension.swift
//  MovieTracker
//
//  Copyright © 2018 Bhavya D J. All rights reserved.
//
import Foundation
import CoreData

extension Tv {
    
    convenience init(data: [String: Any], category: String, insertInto context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Tv", in: context)!
        self.init(entity: entity, insertInto: context)
        
        title = (data["name"] as! String)
        overview = (data["overview"] as! String)
        rating = (data["vote_average"] as! Double)
        imageUrl = (data["poster_path"] as? String)
        releaseDate = (data["first_air_date"] as? String)
        
        self.category = category
    }
}

//
//  MovieDBClient.swift
//  MovieTracker
//
//  Copyright © 2018 Bhavya D J. All rights reserved.
//

import UIKit

enum ContentType: String {
    case tv
    case movie
    case person
}

enum ContentCategory: String {
    case popular
    case upcoming
    case top_rated
    case on_the_air
    case now_playing
    case airing_today
}

struct API {
    
    static let api_key = "212df418efe518fc7cd7dfcae9f8c587"
    static let api_url = "https://api.themoviedb.org/3"
    static let image_url = "https://image.tmdb.org/t/p/w500"
    
    static func getContent(contentType: ContentType, contentCategory: ContentCategory, handler: @escaping (_ results: [String: Any]) -> Void) {
        let url = "\(api_url)/\(contentType)/\(contentCategory)?api_key=\(api_key)"
        
        let contentTask = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {
            
            guard $2 == nil else {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkError"), object: nil)
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: $0!, options: .allowFragments)
            
            let results = (json as! [String: Any])["results"] as? [[String: Any]]
            
            handler([
                "results": results!,
                "contentType": contentType,
                "contentCategory": contentCategory
                ])
        })
        
        contentTask.resume()
    }
    
     static func getImage(ext: String?, handler: @escaping (_ imageData: Data) -> Void) {
        
        let url: String
        
        if let ext = ext {
            url = "\(image_url)/\(ext)"
        } else {
            url = "https://placehold.it/500x500"
        }
        
        let imageTask = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {
            
            guard $2 == nil else {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkError"), object: nil)
                return
            }
            
            handler($0!)
        })
        
        imageTask.resume()
    }
}

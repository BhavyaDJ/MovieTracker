//
//  DetailViewController.swift
//  MovieTracker
//
//  Copyright © 2018 Bhavya D J. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var content: Any!
    var contentType: ContentType?
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var overviewText: UITextView!
    @IBOutlet weak var information: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closedButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let contentType = contentType {
            switch contentType {
            case .tv:
                let content = self.content as! Tv
                titleLabel.text = content.title
                overviewText.text = content.overview
                photoImage.image = UIImage(data: content.imageData! as Data)
                
                let info = "Release Date: \(content.releaseDate!) Rating: \(content.rating)"
                self.information.setTitle(info, for: .disabled)
            case .movie:
                let content = self.content as! Movie
                titleLabel.text = content.title
                overviewText.text = content.overview
                photoImage.image = UIImage(data: content.imageData! as Data)
                
                let info = "Release Date: \(content.releaseDate!) Rating: \(content.rating)"
                self.information.setTitle(info, for: .disabled)
            case .person:
                let content = self.content as! Person
                titleLabel.text = content.name
                overviewText.text = ""
                photoImage.image = UIImage(data: content.imageData! as Data)
                
                let info = "Popularity: \(content.popularity)"
                self.information.setTitle(info, for: .disabled)
            }
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

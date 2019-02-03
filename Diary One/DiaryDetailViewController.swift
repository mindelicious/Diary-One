//
//  DiaryDetailViewController.swift
//  Diary One
//
//  Created by Matt on 10/01/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class DiaryDetailViewController: UIViewController {

    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var diaryTextlabel: UILabel!
    
    var entry : Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let entry = self.entry {
            title = entry.datePrettyString()
            
            diaryTextlabel.text = entry.text
            
            for picture in entry.pictures {
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFit
                let ratio = picture.fullImage().size.height / picture.fullImage().size.width
                imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.0)
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: ratio).isActive = true
                imageView.image = picture.fullImage()
                stackView.addArrangedSubview(imageView)
            }
        } else {
            diaryTextlabel.text = ""
        }
        
    }
 

}


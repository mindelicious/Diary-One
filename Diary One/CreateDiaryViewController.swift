//
//  CreateDiaryViewController.swift
//  Diary One
//
//  Created by Matt on 10/01/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class CreateDiaryViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var setDateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
    }
    @IBAction func saveTapped(_ sender: Any) {
    }
    @IBAction func calendarTapped(_ sender: Any) {
    }
    @IBAction func cameraGRTapped(_ sender: Any) {
    }
    @IBAction func setDateTapped(_ sender: Any) {
    }
    
    
   

}

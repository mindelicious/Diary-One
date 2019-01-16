//
//  CreateDiaryViewController.swift
//  Diary One
//
//  Created by Matt on 10/01/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class CreateDiaryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

//    var date = Date.self
    var imagePicker = UIImagePickerController()
    var images : [UIImage] = []
    var startWithCamera = false
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var setDateButton: UIButton!
    @IBOutlet weak var bottomConstarints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        imagePicker.delegate = self


    }
    // MARK: - Update Date
    
    override func viewWillAppear(_ animated: Bool) {
        updateDate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if startWithCamera {
            startWithCamera = false
            cameraGRTapped("")
        }
    }
    func updateDate() {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "E, d MMM yyyy"
        
        let strDate = dateFormatter.string(from: datePicker.date)
        navBar.topItem?.title = strDate
    }
    
    
    // MARK: - Moving View with Keyboard
    
    @objc func keyboardWillShow(notification: NSNotification) {
        changeKeyboardHieght(notification: notification as Notification)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        changeKeyboardHieght(notification: notification as Notification)
    }
 
    func changeKeyboardHieght(notification:Notification) {
        if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
            let keyHeight = keyboardSize.cgRectValue.height
            bottomConstarints.constant = keyHeight + 10
        }
    }
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
    }
    @IBAction func calendarTapped(_ sender: Any) {
        textview.isHidden = true
        datePicker.isHidden = false
        setDateButton.isHidden = false
       
    }
    
    // MARK: - Picking Photo From Library Method
    
    @IBAction func cameraGRTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
        if let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            images.append(chosenImage)
            let imageView = UIImageView()
            imageView.heightAnchor.constraint(equalToConstant: 65.0).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
            imageView.image = chosenImage
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            stackView.addArrangedSubview(imageView)
            imagePicker.dismiss(animated: true) {
                //Animation
            }
        }
    }
    
    @IBAction func setDateTapped(_ sender: Any) {
        textview.isHidden = false
        datePicker.isHidden = true
        setDateButton.isHidden = true
        updateDate()
        
    }
    
    
   

}

//
//  DiaryTableViewController.swift
//  Diary One
//
//  Created by Matt on 10/01/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit
import RealmSwift

class DiaryTableViewController: UITableViewController {

    @IBOutlet weak var cameraIcon: UIButton!
    @IBOutlet weak var plusIcon: UIButton!
    var entries : Results<Entry>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cameraIcon.imageView?.contentMode = .scaleAspectFit
        plusIcon.imageView?.contentMode = .scaleAspectFit
    }
    
    // MARK: - Realm
    func getEntries() {
        if let realm = try? Realm() {
            entries = realm.objects(Entry.self).sorted(byKeyPath: "date", ascending: false)
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getEntries()
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToNew", sender: "camera")
    }

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToNew", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNew" {
            if let text = sender as? String {
                if text == "camera" {
                    let createVC = segue.destination as? CreateDiaryViewController
                    createVC?.startWithCamera = true
                }
            }
        }
    }
    
    // MARK: - Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let entries = self.entries {
            return entries.count
        } else {
        return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCell", for: indexPath) as? DiaryCell {
            if let entry = entries?[indexPath.row] {
                if let image = entry.pictures.first?.thumbnail() {
                    cell.imageViewWidth.constant = 100
                    cell.previewImageView.image = image
                } else {
                    cell.imageViewWidth.constant = 0
                }
            }
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

class DiaryCell: UITableViewCell {
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var previewTextLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
}


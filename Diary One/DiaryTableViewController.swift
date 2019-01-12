//
//  DiaryTableViewController.swift
//  Diary One
//
//  Created by Matt on 10/01/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class DiaryTableViewController: UITableViewController {

    @IBOutlet weak var cameraIcon: UIButton!
    @IBOutlet weak var plusIcon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cameraIcon.imageView?.contentMode = .scaleAspectFit
        plusIcon.imageView?.contentMode = .scaleAspectFit
    }

    
    @IBAction func cameraTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToNew", sender: "camer")
    }

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToNew", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
   
    
    
}

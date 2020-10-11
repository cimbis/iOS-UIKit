//
//  ViewController.swift
//  TableView_1
//
//  Created by Janis Cimbulis on 09/05/2020.
//  Copyright © 2020 Janis Cimbulis. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items.sorted() {
            print(">>> ITEM: \(item)")
            if item.hasPrefix("nssl") {
                self.pictures.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            viewController.selectedImage = self.pictures[indexPath.row]
            viewController.imageName = indexPath.row
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}


    

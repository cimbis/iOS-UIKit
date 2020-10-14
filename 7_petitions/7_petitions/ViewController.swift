//
//  ViewController.swift
//  7_petitions
//
//  Created by Janis Cimbulis on 14/10/2020.
//

import UIKit


class ViewController: UITableViewController {

    var petitions = [Petition]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parseAndLoad(json: data)
            }
        }

    }


    override func tableView(
            _ tableView: UITableView,
            numberOfRowsInSection section: Int
    ) -> Int {

        return petitions.count
    }


    override func tableView(
            _ tableView: UITableView,
            cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
                withIdentifier: "Cell",
                for: indexPath
        )
        let petitionForCell = petitions[indexPath.row]

        cell.textLabel?.text = petitionForCell.title
        cell.detailTextLabel?.text = petitionForCell.body

        return cell
    }


    func parseAndLoad(json: Data) {

        let decoder = JSONDecoder()

        if let jsonPetitions = try?
        decoder.decode(PetitionList.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
}


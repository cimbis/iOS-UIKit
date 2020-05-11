//
//  ViewController.swift
//  FlagGame1
//
//  Created by Janis Cimbulis on 11/05/2020.
//  Copyright © 2020 Janis Cimbulis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    var countries = [String]()
    var score = 0
    var correctAnswer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy",
                      "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        self.setFlagPreferences()
        self.askQuestion()
    }

    func setFlagPreferences() {
        self.button1.layer.borderWidth = 1
        self.button2.layer.borderWidth = 1
        self.button3.layer.borderWidth = 1

        let borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor

        self.button1.layer.borderColor = borderColor
        self.button2.layer.borderColor = borderColor
        self.button3.layer.borderColor = borderColor
    }

    func askQuestion(_: UIAlertAction! = nil) {
        self.countries.shuffle()
        self.correctAnswer = Int.random(in: 0...2)

        self.button1.setImage(UIImage(named: countries[0]), for: .normal)
        self.button2.setImage(UIImage(named: countries[1]), for: .normal)
        self.button3.setImage(UIImage(named: countries[2]), for: .normal)

        title = countries[self.correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == self.correctAnswer {
            title = "Correct"
            self.score += 1
        }
        else {
            title = "Wrong"
            self.score -= 1
        }

        let alertCtrl = UIAlertController(
                title: title,
                message: "Your score \(score)",
                preferredStyle: .alert
        )

        alertCtrl.addAction(UIAlertAction(
                title: "Continue", 
                style: .default,
                handler: self.askQuestion)
        )

        present(alertCtrl, animated: true)
    }
}


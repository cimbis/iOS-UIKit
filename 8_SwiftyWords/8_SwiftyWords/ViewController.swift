//
//  ViewController.swift
//  8_SwiftyWords
//
//  Created by Janis Cimbulis on 16/10/2020.
//

import UIKit


class ViewController: UIViewController {

    var scoreLabel: UILabel!
    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var currentAnswer: UITextField!
    var submitButton: UIButton!
    var clearButton: UIButton!
    var buttonsView: UIView!

    var scoreLabelConstraints: [NSLayoutConstraint]!
    var cluesLabelConstraints: [NSLayoutConstraint]!
    var answersLabelConstraints: [NSLayoutConstraint]!
    var answerFieldConstraints: [NSLayoutConstraint]!
    var submitButtonConstraints: [NSLayoutConstraint]!
    var clearButtonConstraints: [NSLayoutConstraint]!
    var buttonsViewConstraints: [NSLayoutConstraint]!

    var letterButtons = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        createMainView()

        createScoreLabel()
        createCluesLabel()
        createAnswersLabel()

        createAnswerField()
        createSubmitButton()
        createClearButton()

        createButtonsView()

        activateConstraints()
    }


}


//
//  ViewController+LayoutInitialization.swift
//  8_SwiftyWords
//
//  Created by Janis Cimbulis on 16/10/2020.
//

import UIKit


extension ViewController {

    // MARK: UI initialization


    func createMainView() {
        view = UIView()
        view.backgroundColor = .systemBackground
    }

    func createScoreLabel() {
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: 0"
        scoreLabel.textColor = .systemGray
        scoreLabel.textAlignment = .right

        view.addSubview(scoreLabel)

        scoreLabelConstraints = [
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
        ]
    }

    func createCluesLabel() {
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.text = "Clues"
        cluesLabel.textColor = .systemGray
        cluesLabel.numberOfLines = 0

        view.addSubview(cluesLabel)

        cluesLabelConstraints = [
            // pin the top of the clues label to teh bottom of the score label
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),

            // pin the leading edge of the clues label to the leading edge
            // of layout margins, adding 100 points for more space
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),

            // make the clues label 6-% of the width of layout margins,
            // minus 100 (the leading anchor constant)
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100), ]
    }

    func createAnswersLabel() {
        answersLabel = UILabel()
        answersLabel.translatesAutoresizingMaskIntoConstraints = false
        answersLabel.font = UIFont.systemFont(ofSize: 24)
        answersLabel.text = "Answers"
        answersLabel.textColor = .systemGray
        answersLabel.textAlignment = .right
        answersLabel.numberOfLines = 0

        view.addSubview(answersLabel)

        answersLabelConstraints = [
            // pin top of the answers label to the bottom of score label
            answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),

            // make answers label stick to the trailing edge of layout margins, minus 100
            answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),

            // make the answers label take up to 40% of the available space, minus 100
            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),

            // make the answers label match the height of the clues label
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
        ]
    }

    func createAnswerField() {
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled = false

        view.addSubview(currentAnswer)

        answerFieldConstraints = [
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
        ]
    }

    func createSubmitButton() {
        submitButton = UIButton(type: .system)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Submit", for: .normal)

        view.addSubview(submitButton)

        submitButtonConstraints = [
            submitButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submitButton.heightAnchor.constraint(equalToConstant: 44)
        ]
    }

    func createClearButton() {
        clearButton = UIButton(type: .system)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("Clear", for: .normal)

        view.addSubview(clearButton)

        clearButtonConstraints = [
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clearButton.centerYAnchor.constraint(equalTo: submitButton.centerYAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 44)
        ]
    }

    func createButtonsView() {
        buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(buttonsView)

        buttonsViewConstraints = [
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
        ]
    }


    // MARK: set view constraints

    func activateConstraints() {
        var activatableConstraints: [NSLayoutConstraint] = []

        activatableConstraints.append(contentsOf: scoreLabelConstraints)
        activatableConstraints.append(contentsOf: cluesLabelConstraints)
        activatableConstraints.append(contentsOf: answersLabelConstraints)
        activatableConstraints.append(contentsOf: answerFieldConstraints)
        activatableConstraints.append(contentsOf: submitButtonConstraints)
        activatableConstraints.append(contentsOf: clearButtonConstraints)
        activatableConstraints.append(contentsOf: buttonsViewConstraints)

        NSLayoutConstraint.activate(activatableConstraints)
    }

}

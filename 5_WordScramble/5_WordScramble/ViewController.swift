//
//  ViewController.swift
//  5_WordScramble

import UIKit


class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializePromptForAnswer()
        initializeWordArray()
        startGame()
    }

    override func tableView(
            _ tableView: UITableView,
            numberOfRowsInSection section: Int
    ) -> Int {
        return usedWords.count
    }

    override func tableView(
            _ tableView: UITableView,
            cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        tableView.register(
                UITableViewCell.self,
                forCellReuseIdentifier: "Word"
        )
        let cell = tableView.dequeueReusableCell(
                withIdentifier: "Word",
                for: indexPath
        )
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }

    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll()
        tableView.reloadData()
    }

    func initializeWordArray() {
        if let startWordsURL = Bundle.main.url(
                forResource: "start",
                withExtension: "txt"
        ) {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }

        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
    }

    func initializePromptForAnswer() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(promptForAnswer)
        )
    }

    func submit(_ answer: String) {
        let lowerCaseAnswer = answer.lowercased()

        let errorTitle: String
        let errorMessage: String

        if isPossible(word: lowerCaseAnswer) {

            if isOriginal(word: lowerCaseAnswer) {

                if isReal(word: lowerCaseAnswer) {
                    usedWords.insert(answer, at: 0)

                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)

                    return
                }
                else { // not real
                    errorTitle = "Word is not recognized"
                    errorMessage = "Use english words only"
                }
            }
            else { // not original
                errorTitle = "Word used already"
                errorMessage = "Try different one"
            }
        }
        else { // not possible
            guard let originalWordLowercased = title?.lowercased()
            else {
                return
            }
            errorTitle = "Word is not possible"
            errorMessage = "Impossible to spell from '\( originalWordLowercased )'"
        }

        let ac = UIAlertController(
                title: errorTitle,
                message: errorMessage,
                preferredStyle: .alert
        )
        ac.addAction(UIAlertAction(
                title: "OK",
                style: .default
        ))

        present(ac, animated: true)
    }

    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased()
        else {
            return false
        }

        for letter in word {
            if let letterFoundAtIndex = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: letterFoundAtIndex)
            }
            else {
                return false
            }
        }
        return true
    }

    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }

    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(
                location: 0,
                // UIKit (because it's written in  Objective-C)
                // has different way of counting characters than Swift
                // hence the "utf16"
                length: word.utf16.count
        )
        let misspelledRange = checker.rangeOfMisspelledWord(
                in: word,
                range: range,
                startingAt: 0,
                wrap: false,
                language: "en"
        )
        return misspelledRange.location == NSNotFound
    }

    @objc func promptForAnswer() {
        let ac = UIAlertController(
                title: "Enter an answer",
                message: nil,
                preferredStyle: .alert
        )
        ac.addTextField()

        let submitAction = UIAlertAction(
                title: "Submit",
                style: .default
        ) { [weak self, weak ac] _ in

            guard let answer = ac?.textFields?[0].text
            else {
                return
            }

            self?.submit(answer)
        }

        ac.addAction(submitAction)
        present(ac, animated: true)
    }
}


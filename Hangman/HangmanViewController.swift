//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    @IBOutlet weak var hangmanImage: UIImageView!
    let hang = Hangman()
    
    @IBAction func startNewGame(sender: AnyObject) {
        hang.start()
        self.userGuess.text = hang.knownString
        hangmanImage.image = UIImage(named: "hangman1.gif")
        self.lettersGuessed.text = "Guessed: "
    }
    @IBOutlet weak var userGuess: UILabel!
    @IBOutlet weak var itemText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hang.start()
        self.userGuess.text = hang.knownString
        hangmanImage.image = UIImage(named: "hangman1.gif")
        
    }
    
    @IBAction func startOverGame(sender: AnyObject) {
        hang.start()
        self.userGuess.text = hang.knownString
        hangmanImage.image = UIImage(named: "hangman1.gif")
        self.lettersGuessed.text = "Guessed: "
        
    }
    
    var i = 2;
    var string = "Guessed: "
    
    @IBAction func guessButton(sender: AnyObject) {
        var letter = self.itemText.text!.uppercaseString
        if (letter.characters.count == 1) {
            let result = hang.guessLetter(letter)
            
    
            itemText.text = ""
            
            if (result == false) {
                var name = "hangman\(i).gif"
                hangmanImage.image = UIImage(named: name)
                i += 1
            }
            else {
                self.userGuess.text = hang.knownString
            }
        
            self.lettersGuessed.text = string + hang.guesses()
        
            if (hang.knownString == hang.answer!) {
                let alert = UIAlertView()
                alert.title = "Alert"
                alert.message = "You Win!"
                alert.addButtonWithTitle("New Game")
                alert.show()
            }
        
            if (i == 7) {
                let alert = UIAlertView()
                alert.title = "Alert"
                alert.message = "You Lost!"
                alert.addButtonWithTitle("Start Over")
                alert.show()
            }
        }
        else {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Please only enter one letter!"
            alert.addButtonWithTitle("Try again")
            alert.show()
            itemText.text = ""
        }
    }
    
    @IBOutlet weak var lettersGuessed: UILabel!


    @IBOutlet weak var StartGame: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //hang.start()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        itemText.resignFirstResponder()
        return true
        
    }
}


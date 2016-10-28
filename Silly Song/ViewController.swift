//
//  ViewController.swift
//  Silly Song
//
//  Created by Ilia J on 9/18/16.
//  Copyright © 2016 Lulu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func reset(_ sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: AnyObject) {
        if let nameFieldText = nameField.text {
            lyricsView.text = lyricsForName(name: nameFieldText)
        }
    }
        }

func shortNameFromName(name: String) -> String{
    
    let lowercaseName = name.lowercased()
    let vowelSet = NSCharacterSet(charactersIn: "aeiou")
   // if let firstVowelRange = lowercaseName.rangeOfCharacterFromSet(vowelSet, options: .CaseInsensitiveSearch){
    
     if let firstVowelRange = lowercaseName.rangeOfCharacter(from: vowelSet as CharacterSet) {
        return lowercaseName.substring(from: firstVowelRange.lowerBound)
    }
    return lowercaseName
}


func lyricsForName(name: String) -> String {
    let short = shortNameFromName(name: name)
    
    return "#f, #f, Bo B#s\nBanana Fana Fo F#s\nMe My Mo M#s\n#f"

        .replacingOccurrences(of: "#f", with: name)
        .replacingOccurrences(of: "#s", with: short)
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ nameField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return false
    }
}

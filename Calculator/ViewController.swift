//
//  ViewController.swift
//  Calculator
//
//  Created by Oreoluwa Lawal on 2022-02-06.
//

import UIKit

class ViewController: UIViewController {
    
    var wholeEquation: [String] = [];
    var number: String = "";
    var advanceHistory = "";
    var finalAnswer = "";
    
    @IBOutlet weak var viewHistory: UILabel!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    
    //call calculator class
    let calculator = Calculator();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewHistory.isHidden = true
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //Checks if user presses "=" to calculate and display answer
        if sender.titleLabel?.text == "="{
            //calculate equation
            finalAnswer = calculator.calculate(b: wholeEquation);
            displayLabel.text = displayLabel.text! + " = " + finalAnswer
            
            //Display equations if user clicks on advance history
            if(viewHistory.isHidden == false){
                advanceHistory = displayLabel.text!
                viewHistory.text = viewHistory.text! + displayLabel.text! + "\n"
            }
            
            calculator.stringNum = []
            calculator.stringVal = ""
        }
        else{ //if user doesn't press "=", then we keep on adding the user input to the array
            number = (sender.titleLabel?.text)!
            wholeEquation = calculator.push(value: number)
            
            //Check if input is in correct format, if not an alert is displayed
            for start in 0...wholeEquation.count-1{
                if(start % 2 == 0){
                    let x = wholeEquation[start]
                    if(x != "1" && x != "2" && x != "3" && x != "4" && x != "5" && x != "6" && x != "7" && x != "8" && x != "9"&&x != "0"){
                        let errorMessage = UIAlertController(title: "Error", message: "Wrong input", preferredStyle: .alert)
                        let okButton = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                            print("Ok button tapped")
                        })
                        
                        errorMessage.addAction(okButton)
                        self.present(errorMessage, animated: true, completion: nil)
                        
                        wholeEquation = []
                        calculator.stringNum = []
                        break;
                    }
                }
                else if(start % 2 != 0){
                    let x = wholeEquation[start]
                    if(x != "+" && x != "-" && x != "/" && x != "*" ){
                        let errorMessage = UIAlertController(title: "Error", message: "Wrong input", preferredStyle: .alert)
                        let okButton = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                            print("Ok button tapped")
                        })
                        
                        errorMessage.addAction(okButton)
                        self.present(errorMessage, animated: true, completion: nil)
                        
                        wholeEquation = []
                        calculator.stringNum = []
                        break;
                    }
                }
            }
            displayLabel.text = displayLabel.text! + " " + number
        }
    }
    
    //Cancel user inputs from screen
    @IBAction func cancelButton(_ sender: UIButton) {
        displayLabel.text = ""
        wholeEquation = []
        calculator.stringNum = []
    }
    
    //Change display when user clicks advance/standard history
    @IBAction func advanceHistory(_ sender: UIButton) {
        
        if(viewHistory.isHidden == true){
            historyButton.setTitle("Standard - No History", for: .normal)
            viewHistory.isHidden = false
        }
        else{
            viewHistory.text = ""
            viewHistory.isHidden = true
            historyButton.setTitle("Advance - With History", for: .normal)
        }
    }
}


//
//  ViewController.swift
//  Calculator
//edit add method, and add all others as well
//

import UIKit

class ViewController: UIViewController {
    
    /*practice
    var value1 = "value1";
    var control = true;
    var operator1 = "op1";
    var answer = Float(1.5454252);
    var count = 0;
    var placer1bool = false;
    var placer2bool = true;
    var placer1 = "none";
    var placer2 = "none";
    var final = [Float("0")];
    var finalValue = Float(0);
    */
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    var isFinishedTypingNumber = true;
    /* practice 2
    var calc = ["0"];
    var sum = Double(0);
    var i = 0;
    var op = "none";
    */
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        /*preactice
        control = false;
        operator1 = sender.currentTitle!;
        displayLabel.text! = "";
        print(operator1);
        
        if (placer1bool == true)
        {
            placer1 = value1;
            placer1bool = false;
            placer2bool = true;
        }
        
        else if (placer2bool == true)
        {
            placer2 = value1;
            placer1bool = true;
            placer2bool = false;
        }
        print("placer1 \(placer1)")
        print("placer2 \(placer2)")
        if (count == 0){
            answer = Float(placer2)!;
        }
        if (count != 0 && operator1 == "+")
        {
            answer = Float(placer2)! + Float(placer1)!;
            let x = answer;
            final.append(x);
            finalValue = Float(finalValue) + final[(final.count)-1]!;
            if (placer2bool == true)
           {
                finalValue = finalValue - Float(placer1)!;
                finalValue = finalValue + Float(placer2)!;
           }
            if (placer1bool == true)
           {
                finalValue = finalValue - Float(placer2)!;
                finalValue = finalValue + Float(placer1)!;
            }
        }
        if (operator1 == "AC"){
            value1 = "0";
            answer = 0;
            finalValue = 0;
            placer2 = "0";
            placer1 = "0";
        }
        
        print(finalValue);
        displayLabel.text! = String(finalValue);
        control = true;
        count += 1;
        displayLabel.text! = "";
    }
    */
        isFinishedTypingNumber = true;
       
        let number = Double(displayLabel.text!) ?? 0;
        
        
        /* practice 2
        if (sender.currentTitle! == "+/-"){
            displayLabel.text = String(number * -1);
        }
        
        else if (sender.currentTitle! == "AC"){
            displayLabel.text = "0";
            calc = ["0"];
            sum = Double(0);
            i = 0;
            
        }
        
        else if (sender.currentTitle! == "%"){
            displayLabel.text = String(number / 100);
        }
       
        else if (sender.currentTitle! == "+")
        {
            let placer = displayLabel.text!;
            calc.append(placer);
            op = "+";
           
            while (i < calc.count)
            {
                sum = sum + Double(calc[i])!;
                i += 1;
            }
            displayLabel.text = String(sum);
        }
            
        
        else if (sender.currentTitle! == "-")
               {
                   let placer = displayLabel.text!;
                   calc.append(placer);
                   
                
                while (i < calc.count){
                       sum = sum - Double(calc[i])!;
                       i += 1;
                   }
                   displayLabel.text = String(sum);
               }
        
        else if (sender.currentTitle! == "×")
                      {
                          let placer = displayLabel.text!;
                          calc.append(placer);
                          
                         
                       while (i < calc.count){
                              sum = sum * Double(calc[i])!;
                              i += 1;
                          }
                          displayLabel.text = String(sum);
                      }
        
        else if (sender.currentTitle! == "÷")
                     {
                         let placer = displayLabel.text!;
                         calc.append(placer);
                         
                      
                      while (i < calc.count){
                             sum = sum / Double(calc[i])!;
                             i += 1;
                         }
                         displayLabel.text = String(sum);
                     }
        
        else if (sender.currentTitle! == "=" && op == "+")
                           {
                            
                            //displayLabel.text = "\(sum + Double(calc[calc.count - 1])!)";
                            displayLabel.text = String(sum + Double(displayLabel.text!)!);
                           }
        
        else if (sender.currentTitle! == "=" && op == "-")
                                  {
                                   
                                   //displayLabel.text = "\(sum + Double(calc[calc.count - 1])!)";
                                   displayLabel.text = String(sum - Double(displayLabel.text!)!);
                                  }
        else if (sender.currentTitle! == "=" && op == "×")
                                  {
                                   //displayLabel.text = "\(sum + Double(calc[calc.count - 1])!)";
                                   displayLabel.text = String(sum * Double(displayLabel.text!)!);
                                  }
        else if (sender.currentTitle! == "=" && op == "÷")
                                         {
                                          
                                          //displayLabel.text = "\(sum + Double(calc[calc.count - 1])!)";
                                          displayLabel.text = String(sum / Double(displayLabel.text!)!);
                                         }
         */
        var symbol = sender.currentTitle;
       
            switch symbol {
            case "+/-":
                displayLabel.text = String(number * -1)
            case "AC":
                displayLabel.text = "0"
                intermediateCalculation = nil
            case "%":
                displayLabel.text = String(number * 0.01)
            case "=":
                 let result = performTwoNumCalculation(n2: number)
                intermediateCalculation = nil
                 displayLabel.text = String(result!);
            default:
                var result = number;
              if let previousCalcResult = performTwoNumCalculation(n2: number) {
                                result = previousCalcResult
                            }
                intermediateCalculation = (n1: result, calcMethod: symbol!)
                displayLabel.text = String(result);
                        }
                    }
                   
        
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        /*practie
        if (control == true){
        displayLabel.text! += sender.currentTitle!;
        value1 = displayLabel.text!;
        print(value1);
    }
        */
        if (isFinishedTypingNumber == true){
            if (sender.currentTitle == ".")
            {
                displayLabel.text = "0.";
            }
            else {
            displayLabel.text!  = sender.currentTitle!;
            }
            isFinishedTypingNumber = false;
        }
        else {
            let arr = Array(displayLabel.text!); //converting string into an array of characters
            if (sender.currentTitle == ".")
            {
                if (displayLabel.text == "")
                {
                    displayLabel.text = "0.";
                }
                else if ((displayLabel.text!.contains(".") == false) && arr[arr.count - 1] != ".")
                {
                    displayLabel.text! += sender.currentTitle!;
                }
            }
            else if (sender.currentTitle != "."){
            displayLabel.text! += sender.currentTitle!;
        }
    
}
}
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
         
         if let n1 = intermediateCalculation?.n1,
             let operation = intermediateCalculation?.calcMethod {
             
             switch operation {
             case "+":
                 return (n1 + n2);
             case "-":
                 return (n1 - n2);
             case "×":
                 return (n1 * n2);
             case "÷":
                 return (n1 / n2);
             default:
                 fatalError("The operation passed in does not match any of the cases.")
             }
         }
         return nil
     }
}

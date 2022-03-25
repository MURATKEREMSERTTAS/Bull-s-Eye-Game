//
//  ViewController.swift
//  Bulls Eye Game_2
//
//  Created by lab5 on 4.03.2022.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int=0
    var randomNumber: Int=0
    var score:Int=0
    var raund:Int=0
    var fark:Int=0
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var labelstart:UILabel!
    @IBOutlet weak var lblscore:UILabel!
    @IBOutlet weak var lblRaund : UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartNewGame()
        updateLabels()
    }
    
    
    @IBAction func startOver(){
        StartNewGame()
        updateLabels()
    }
    
    @IBAction func buttonClicked(){
        let message = calculation()
        let alert = UIAlertController(title: "Allert" , message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRaund()
        updateLabels()
    }
    @IBAction func sliderMOVED (_ slider : UISlider ){
        currentValue=lroundf(slider.value)
    }
    
    func startNewRaund(){
    randomNumber=1+Int(arc4random_uniform(100))
    currentValue=50
    slider.value=50
    raund+=1
    }
    
    func updateLabels(){
        labelstart.text="\(randomNumber)"
        lblscore.text="\(score)"
        lblRaund.text="\(raund)"
    }
    func calculation()->String{
        fark=abs(randomNumber-currentValue)
        var message="not even closed"
        if fark==0 {
            score+=200
            message="perfect"
        }
        else if fark<5{
            score+=50+(100-fark)
            message="You are almost had it"
            
        }
        else if fark<10{
            score+=(100-fark)
            message="Pretty God"
        }
        else{
            score+=fark
            message="Not else close"
            
        }
        return message
    }
    
    func StartNewGame(){
        score=0
        raund=0
        startNewRaund()
    }


}

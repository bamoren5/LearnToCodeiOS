//
//  TimeView.swift
//  Learn to Code
//
//  Created by Brian Moreno on 12/12/18.
//  Copyright © 2018 cs347bm. All rights reserved.
//

import UIKit
class TimeViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "Time: \(minutesLabel):0\(secondsLabel)"
        timeStart()
    }
    func sendDataToVc(myString : String) {
        let Vc = parent as! QuestionsViewController
        Vc.dataFromContainer(containerData: myString)
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    var seconds = 600
    var secondsLabel = 0
    var minutesLabel = 10
    var timer: Timer?
    
    func timeStart(){
        timer = Timer(timeInterval: 1, repeats: true) { [weak self] _ in
            self?.counter()
        }
        RunLoop.current.add(timer!, forMode: RunLoop.Mode.common)
    }
    
    @objc func counter(){
        seconds -= 1//real counter
        secondsLabel -= 1
        if(seconds == 599 || seconds == 539 || seconds == 479 || seconds == 419 || seconds == 359 || seconds == 299 || seconds == 239 || seconds == 179 || seconds == 119 || seconds == 59){
            minutesLabel -= 1
            secondsLabel = 59
        }
        if(secondsLabel < 10){
            timeLabel.text = "Time: \(minutesLabel):0\(secondsLabel)"
        }else{
            timeLabel.text = "Time: \(minutesLabel):\(secondsLabel)"}
        if(seconds == 539 || seconds == 479 || seconds == 419 || seconds == 359 || seconds == 299 || seconds == 239 || seconds == 179 || seconds == 119 || seconds == 59){
            popUp()
        }
        else if seconds == 0{
            if timer != nil{
                timer?.invalidate()
                timer = nil
                popUp()
                
            }
        }
    }
    
    func popUp(){
        points = points - 5
        if self.seconds == 0{
            let myAlert = UIAlertController(title: "Times Up!\n60 Second Time Penalty!\n-5 points", message: "", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
                    self.present(nextViewController, animated:true, completion:nil)
                
            })
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            sendDataToVc(myString: "\(points)")
        }
        
        else{
            let myAlert = UIAlertController(title: "60 Second Time Penalty!\n-5 points", message: "", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                print("Okay pressed")
            })
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            sendDataToVc(myString: "\(points)")
        }
        
    }
}

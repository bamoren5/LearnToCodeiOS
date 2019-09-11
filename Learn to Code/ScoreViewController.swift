//
//  Score.swift
//  Learn to Code
//
//  Created by Brian Moreno on 12/12/18.
//  Copyright © 2018 cs347bm. All rights reserved.
//

import UIKit
class ScoreViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(points)"
        points = 0
    }
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var homeBtn: UIButton!
    
}

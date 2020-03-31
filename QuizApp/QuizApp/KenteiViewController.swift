//
//  KenteiViewController.swift
//  QuizApp
//
//  Created by Kazutomo Kita on 2020/03/30.
//  Copyright © 2020 Kazutomo Kita. All rights reserved.
//

import UIKit

class KenteiViewController: UIViewController {
    
    @IBOutlet weak var mondaiNumberLabel: UILabel!
    @IBOutlet weak var mondaiTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    
    var csvArray:[String] = []
    
    var mondaiArray:[String] = []
    var mondaiCount = 0
    var correctCount = 0
    let total = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewController = ViewController()
        
        csvArray = viewController.loadCSV(fileName: "kentei")
        
        mondaiArray = csvArray[mondaiCount].components(separatedBy: ",")
        
        mondaiNumberLabel.text = "第\(mondaiCount+1)問"
        
        mondaiTextView.text = mondaiArray[0]
        
        answerButton1.setTitle(mondaiArray[2], for: .normal)
        answerButton1.setTitle(mondaiArray[3], for: .normal)
        answerButton1.setTitle(mondaiArray[4], for: .normal)
        answerButton1.setTitle(mondaiArray[5], for: .normal)
    }
    
    @IBAction func buttonAction(sender: UIButton) {
        if sender.tag == Int(mondaiArray[1]) {
            judgeImageView.image = UIImage(named: "maru")
            correctCount += 1
        } else {
            judgeImageView.image = UIImage(named: "batsu")
        }
    }

}

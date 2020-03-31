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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

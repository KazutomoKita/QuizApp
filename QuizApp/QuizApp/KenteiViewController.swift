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
    
    var kaisetsuBGImageView = UIImageView()
    var kaisetsuBGX = 0.0
    var seikaiLabel = UILabel()
    var kaisetsuTextView = UITextView()
    var backButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kaisetsuBGImageView.image = UIImage(named: "kaisetsuBG")
        
        /**/let screenSize:CGSize = (UIScreen.main.bounds.size)
        
        kaisetsuBGX = Double(screenSize.width/2) - 320 / 2
        
        kaisetsuBGImageView.frame = CGRect(x: kaisetsuBGX, y:Double(screenSize.height), width: 320, height: 210)
        
        kaisetsuBGImageView.isUserInteractionEnabled = true
        
        self.view.addSubview(kaisetsuBGImageView)
        
        seikaiLabel.frame = CGRect(x: 10, y: 5, width: 300, height: 30)
        seikaiLabel.textAlignment = .center
        seikaiLabel.font = UIFont.systemFont(ofSize: 15)
        
        kaisetsuBGImageView.addSubview(seikaiLabel)
        kaisetsuTextView.frame = CGRect(x: 10, y: 40, width: 300, height: 140)
        kaisetsuTextView.backgroundColor = UIColor.clear
        kaisetsuTextView.font = UIFont.systemFont(ofSize: 17)
        kaisetsuTextView.isEditable = false
        
        kaisetsuBGImageView.addSubview(kaisetsuTextView)
        
        backButton.frame = CGRect(x: 10, y: 180, width: 300, height: 30)
        backButton.setImage(UIImage(named: ""), for: .normal)
        //backButton.setImage(UIImage(named: ""), for: .highLighted)
        backButton.addTarget(self, action: "backButtonTapped", for: UIControl.Event.touchUpInside)
        
        kaisetsuBGImageView.addSubview(backButton)

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
        kaisetsu()
    }
    
    func nextProblem() {
        mondaiCount += 1
        mondaiArray.removeAll()
        mondaiArray = csvArray[mondaiCount].components(separatedBy: ",")
        
        mondaiNumberLabel.text = "第\(mondaiCount+1)問"
        mondaiTextView.text = mondaiArray[0]
        answerButton1.setTitle(mondaiArray[2], for: .normal)
        answerButton2.setTitle(mondaiArray[3], for: .normal)
        answerButton3.setTitle(mondaiArray[4], for: .normal)
        answerButton4.setTitle(mondaiArray[5], for: .normal)
    }
    
    func kaisetsu() {
        seikaiLabel.text = mondaiArray[6]
        kaisetsuTextView.text = mondaiArray[7]
        let answerButtonY = answerButton1.frame.origin.y
        
        UIView.animate(withDuration: 0.5, animations: {() -> Void in self.kaisetsuBGImageView.frame = CGRect(x: self.kaisetsuBGX, y:Double(answerButtonY), width:320, height: 210)})
        
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        
    }

}

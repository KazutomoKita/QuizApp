//
//  KenteiViewController.swift
//  QuizApp
//
//  Created by Kazutomo Kita on 2020/03/30.
//  Copyright © 2020 Kazutomo Kita. All rights reserved.
//

import UIKit

class KenteiViewController: UIViewController {
    
    @IBOutlet weak var mondaiNumber: UILabel!
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
    
    func loadCSV(fileName :String) -> [String] {
        
        var csvArray:[String] = []
        
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        
        
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            
        } catch let error as NSError {
            print("エラー: \(error)")
        }
         return csvArray
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

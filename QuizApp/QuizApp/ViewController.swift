//
//  ViewController.swift
//  QuizApp
//
//  Created by Kazutomo Kita on 2020/03/30.
//  Copyright © 2020 Kazutomo Kita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var creditLabel: UILabel!
    
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
        
        var csvArray = loadCSV(fileName: "start")
        
        //var csvArray = [String]()

        guard let csvBundle = Bundle.main.path(forResource:"start", ofType:"csv") else {
            print("csvファイルがないよ")
            return
        }

        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            //csvArray = csvData.components(separatedBy: .newlines)
            //csvArray.removeLast()
            
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            //csvArray = lineChange.componentsSeparatedByString("\n")
            csvArray = lineChange.components(separatedBy: "\n")
            
        } catch let error as NSError {
            print("エラー: \(error)")
            return
        }
        print(csvArray)
        
        logoImageView.image = UIImage(named: csvArray[0])
        
        titleLabel.text = csvArray[1]
        
        bodyTextView.text = csvArray[2]
        
        creditLabel.text = csvArray[3]
    }


}


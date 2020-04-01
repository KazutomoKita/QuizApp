//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by Kazutomo Kita on 2020/03/30.
//  Copyright © 2020 Kazutomo Kita. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    //正解数を受け取るメンバ変数
    var correct = 0
    
    //正解数を表示するラベル
    @IBOutlet var scoreLabel: UILabel!
    
    //合格 or 不合格画像を表示する画像
    @IBOutlet var judgeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //正解数を表示
        scoreLabel.text = "正解数は\(correct)問です。"
        
        if correct >= 3 {
            judgeImageView.image = UIImage(named: "goukaku")
        } else {
            judgeImageView.image = UIImage(named: "fugoukaku")
        }

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

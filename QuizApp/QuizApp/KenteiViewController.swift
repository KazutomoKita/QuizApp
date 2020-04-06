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
    let total = 7
    
    //解説バックグラウンド画像
    var kaisetsuBGImageView = UIImageView()
    //解説バックグラウンド画像X座標
    var kaisetsuBGX = 0.0
    //正解表示ラベル
    var seikaiLabel = UILabel()
    //解説テキストビュー
    var kaisetsuTextView = UITextView()
    //バックボタン
    var backButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //バックグラウンド画像をセット
        kaisetsuBGImageView.image = UIImage(named: "kaisetsuBG")
        
        //画面サイズを取得
        /**/let screenSize:CGSize = (UIScreen.main.bounds.size)
        
        kaisetsuBGX = Double(screenSize.width/2) - 320 / 2
        
        kaisetsuBGImageView.frame = CGRect(x: kaisetsuBGX, y:Double(screenSize.height), width: 320, height: 210)
        
        //画像上のタッチ動作を可能にする
        kaisetsuBGImageView.isUserInteractionEnabled = true
        
        //画像をviewに配置
        self.view.addSubview(kaisetsuBGImageView)
        
        //正解表示ラベルのフレーム設定
        seikaiLabel.frame = CGRect(x: 10, y: 5, width: 300, height: 30)
        //正解表示ラベルのアライメントをセンターに設定
        seikaiLabel.textAlignment = .center
        //正解ラベルのフォントサイズを15ポイント設定
        seikaiLabel.font = UIFont.systemFont(ofSize: 15)
        //正解ラベル解説バックグラウンド画像に配置
        kaisetsuBGImageView.addSubview(seikaiLabel)
        //解説テキストビューのフレーム設定
        kaisetsuTextView.frame = CGRect(x: 10, y: 40, width: 300, height: 140)
        //解説テキストビューの背景色を透明に設定
        kaisetsuTextView.backgroundColor = UIColor.clear
        //解説ビューのフォントサイズを17ポイントに設定
        kaisetsuTextView.font = UIFont.systemFont(ofSize: 17)
        //テキストビューの変更を不可にする
        kaisetsuTextView.isEditable = false
        //解説テキストビューを解説バックグラウンド画像に配置
        kaisetsuBGImageView.addSubview(kaisetsuTextView)
        //バックボタンのフレームを設定
        backButton.frame = CGRect(x: 10, y: 180, width: 300, height: 30)
        
        //バックボタンに通常時と押下時の画像を設定
        backButton.setImage(UIImage(named: "kenteiBack"), for: .normal)
        backButton.setImage(UIImage(named: "kenteiBackOn"), for: .highlighted)
        backButton.addTarget(self, action: #selector(self.backButtonTapped), for: UIControl.Event.touchUpInside)
        
        //バックボタンを解説バックグラウンドに配置
        kaisetsuBGImageView.addSubview(backButton)

        let viewController = ViewController()
        
        csvArray = viewController.loadCSV(fileName: "kentei")
        
        mondaiArray = csvArray[mondaiCount].components(separatedBy: ",")
        
        mondaiNumberLabel.text = "第\(mondaiCount+1)問"
        
        mondaiTextView.text = mondaiArray[0]
        
        //選択肢ボタンのタイトルに選択肢を設定
        answerButton1.setTitle(mondaiArray[2], for: .normal)
        answerButton2.setTitle(mondaiArray[3], for: .normal)
        answerButton3.setTitle(mondaiArray[4], for: .normal)
        answerButton4.setTitle(mondaiArray[5], for: .normal)
    }
    
    //四択ボタンを押した時のメソッド
    @IBAction func buttonAction(sender: UIButton) {
        //正解番号(Int型にキャスト)とボタンのtagが同じなら正解
        if sender.tag == Int(mondaiArray[1]) {
            //○を表示
            judgeImageView.image = UIImage(named: "maru")
            correctCount += 1
        } else {
            //間違っていたら×を表示
            judgeImageView.image = UIImage(named: "batsu")
        }
    
        
        //judgementImageViewを表示
        judgeImageView.isHidden = false
        //解説メソッド呼び出し
        kaisetsu()
    }
    
    //次の問題を表示するメソッド
    func nextProblem() {
        //問題カウント変数をカウントアップ
        mondaiCount += 1
        
        //mondaiArrayに格納されている問題配列を削除
        mondaiArray.removeAll()
        
        if mondaiCount < total {
            //csvArrayから次の問題配列をmondaiArrayに格納
            mondaiArray = csvArray[mondaiCount].components(separatedBy: ",")
        
            //問題数ラベル、問題表示TextView, 選択肢ボタンに文字をセット
            mondaiNumberLabel.text = "第\(mondaiCount+1)問"
            mondaiTextView.text = mondaiArray[0]
            answerButton1.setTitle(mondaiArray[2], for: .normal)
            answerButton2.setTitle(mondaiArray[3], for: .normal)
            answerButton3.setTitle(mondaiArray[4], for: .normal)
            answerButton4.setTitle(mondaiArray[5], for: .normal)
        } else {
            performSegue(withIdentifier: "score", sender: nil)
        }
    }
    
    //解説表示メソッド
    func kaisetsu() {
        //正解表示ラベルのテキストをmondaiArrayから取得
        seikaiLabel.text = mondaiArray[6]
        //解説テキストビューのテキストをmondaiArrayから取得
        kaisetsuTextView.text = mondaiArray[7]
        //ボタンのy座標取得
        let answerButtonY = answerButton1.frame.origin.y
        //解説バックグラウンドを表示させるアニメーション
        UIView.animate(withDuration: 0.5, animations: {() -> Void in self.kaisetsuBGImageView.frame = CGRect(x: self.kaisetsuBGX, y:Double(answerButtonY), width:320, height: 210)})
        
        //選択肢ボタンの使用停止
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        
    }
    

    
    //バックボタンメソッド
    @objc func backButtonTapped(){
        //画面の縦サイズを取得
        let screenHeight = Double(UIScreen.main.bounds.size.height)
        
        //解説バックグラウンド画像を枠外に移動させるアニメーション
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            self.kaisetsuBGImageView.frame = CGRect(x: self.kaisetsuBGX, y: screenHeight, width: 320, height: 210)
        })
        
        //選択肢ボタンの使用を再開
        answerButton1.isEnabled = true
        answerButton2.isEnabled = true
        answerButton3.isEnabled = true
        answerButton4.isEnabled = true
        //正誤表示画像を隠す
        judgeImageView.isHidden = true
        nextProblem()
    }
    
    //得点画面に値渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sVC = segue.destination as! ScoreViewController
        sVC.correct = correctCount
    }

}

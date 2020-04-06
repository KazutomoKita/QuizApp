import UIKit

class ScoreViewController: UIViewController {
    
    //正解数を受け取るメンバ変数
    var correct = 0
    
    //正解数を表示するラベル
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var goukakuTimesLabel: UILabel! //合格数を表示する変数
    @IBOutlet var rankLabel: UILabel! //ランクを表示する変数
    var goukakuTimes = 0 //合格回数を格納する変数
    var rankString = "ビギナー" //照合変数。初期値はビギナー
    
    //合格 or 不合格画像を表示する画像
    @IBOutlet var judgeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //合格回数を表示するNSUserDefaults
        let goukakuUd = UserDefaults.standard
        //合格回数をgoukakuを言うキー値で変数goukakuTimesに格納
        goukakuTimes = goukakuUd.integer(forKey: "goukaku")
        
        //正解数を表示
        scoreLabel.text = "正解数は\(correct)問です。"
        
        if correct >= 5 {
            judgeImageView.image = UIImage(named: "goukaku")
            goukakuTimes += 1 //合格回数をカウントアップ
            //goukakuキー値を使って合格回数(goukakuTimes)を保存
            goukakuUd.set(goukakuTimes, forKey: "goukaku")
        } else {
            judgeImageView.image = UIImage(named: "fugoukaku")
        }

        //合格回数を表示
        goukakuTimesLabel.text = "合格回数は\(goukakuTimes)回です。"
        
        
        //合格回数によってランクを決定
        if goukakuTimes >= 5 {
            rankString = "ローリングストーン誌の編集者"
        }else if goukakuTimes >= 4 {
            rankString = "ロックオタク"
        }else if goukakuTimes >= 3 {
            rankString = "ロックマニア"
        }else if goukakuTimes >= 2 {
            rankString = "ロック好き"
        }else if goukakuTimes >= 1 {
            rankString = "ただのファン"
        }else if goukakuTimes >= 0 {
            rankString = "ビギナー"
        }
        
        //ランクラベルに称号を設定
        rankLabel.text = "ランクは\(rankString)!"
    }

}

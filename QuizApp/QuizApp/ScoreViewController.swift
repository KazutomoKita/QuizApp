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
        
        if correct >= 5 {
            judgeImageView.image = UIImage(named: "goukaku")
        } else {
            judgeImageView.image = UIImage(named: "fugoukaku")
        }

    }

}

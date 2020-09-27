//
//  IntroViewController.swift
//  NewsApp
//
//  Created by 茶谷美咲 on 2020/09/20.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//

import UIKit
//アニメーション写すライブラリ
import Lottie


class IntroViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    
//   JSONファイルを入れる
    var JsonArray = ["1","2","3","4",]
    var JsonStringArray = ["左にスワイプしてください","趣味を楽しむ人に","楽しくなるニュースを","お届けします。",]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ページングができるようになるコード
        scrollView.isPagingEnabled = true
//        下で定義したsetUpScrollをviewDidLoadで読み込んであげる
        setUpScroll()
        
        
//        JSONファイルのアニメーションの幅、高さやアニメーションのやり方をコードで設定するところ
//        JSONファイルが4枚だから0...3と表記して4枚にforする
        for a in 0...3{
            
            let animationView = AnimationView()
            let animation = Animation.named(JsonArray[a])
//            CGRectaはサイズ指定するため
            animationView.frame = CGRect(x: CGFloat(a) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
//            animationView.frame = CGRect(x:0.0, y:100.0, width:200.0, height:200.0)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
        
        
    }
//    何回も呼び込むやつ
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationControllerを消す
        self.navigationController?.isNavigationBarHidden = true
    }
    
//    スクロールビューのための関数を定義する
    func setUpScroll(){
        
        scrollView.delegate = self
//        スクロールの可動領域
        /*
         view.frame.size.width　画面全体  *4 はJSON配列の全てを持ってくるという意味
         
         */
        scrollView.contentSize = CGSize(width: view.frame.size.width * 4, height: scrollView.frame.size.height)
        
//        for文で自動ラベルを設定するため
        for a in 0...3{
//      aはInt型だからCGFloat型にキャストしたものをフレームサイズ幅
//       aは0だからX字軸は0、/3は画面を3分割した下の方に置く設定
//        スクロールラベルの幅高さもここで設定
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(a) * view.frame.size.width, y: view.frame.size.height / 3, width: scrollView.frame.size.width , height:
                scrollView.frame.size.height))
            
//変数onboaedLabelのフォント、カラー、バックグラウンドカラー、配置、どこの配列から持ってくるか等をここで記載
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textColor = .white
            onboardLabel.backgroundColor = .gray
            onboardLabel.textAlignment = .center
            onboardLabel.text = JsonStringArray[a]
//            スクロールビューをaddSubViewする
            scrollView.addSubview(onboardLabel)
            
        }
        
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

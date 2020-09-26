//
//  IntroViewController.swift
//  NewsApp
//
//  Created by 茶谷美咲 on 2020/09/20.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//

import UIKit
//アニメーションLottieを使う
import Lottie


class IntroViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
   
    var JsonArray = ["1","2","3","4",]
    var JsonStringArray = ["左にスワイプしてください","趣味を楽しむ人に","楽しくなるニュースを","お届けします。",]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isPagingEnabled = true
        setUpScroll()
        
        for a in 0...3{
            
            let animationView = AnimationView()
            let animation = Animation.named(JsonArray[a])
            animationView.frame = CGRect(x: CGFloat(a) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
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
//        スクロール領域
        /*
         view.frame.size.width　画面全体  *9 は配列を表示したいため
         
         */
        scrollView.contentSize = CGSize(width: view.frame.size.width * 4, height: scrollView.frame.size.height)
        
//        for文で自動ラベルを設定するため　めちゃむず　　　再度理解必須　351
        for a in 0...3{
            
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(a) * view.frame.size.width, y: view.frame.size.height / 5, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textColor = .white
            onboardLabel.backgroundColor = .gray
            onboardLabel.textAlignment = .center
            onboardLabel.text = JsonStringArray[a]
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

//
//  TopViewController.swift
//  NewsApp
//
//  Created by 茶谷美咲 on 2020/09/23.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//ナビゲーションアイテムを消すコード
        self.navigationItem.hidesBackButton = true
        
    }
    
    
    @IBAction func eigaButton(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
          let storyboard: UIStoryboard = self.storyboard!
          //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
          let second = storyboard.instantiateViewController(withIdentifier: "eiga")as! Page1ViewController
          //ここが実際に移動するコードとなります
          self.navigationController?.pushViewController(second, animated: true)
    }
    
    
    @IBAction func animeButton(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
          let storyboard: UIStoryboard = self.storyboard!
          //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
          let second = storyboard.instantiateViewController(withIdentifier: "anime")as! Page2ViewController
          //ここが実際に移動するコードとなります
          self.navigationController?.pushViewController(second, animated: true)
    }
    

    
    @IBAction func owaraiButton(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
          let storyboard: UIStoryboard = self.storyboard!
          //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
          let second = storyboard.instantiateViewController(withIdentifier: "owarai")as! Page3ViewController
          //ここが実際に移動するコードとなります
          self.navigationController?.pushViewController(second, animated: true)
    }
    
    
    @IBAction func ryokoButton(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
          let storyboard: UIStoryboard = self.storyboard!
          //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
          let second = storyboard.instantiateViewController(withIdentifier: "ryoko")as! Page4ViewController
          //ここが実際に移動するコードとなります
          self.navigationController?.pushViewController(second, animated: true)
    }
    
    
    @IBAction func nekoButton(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
          let storyboard: UIStoryboard = self.storyboard!
          //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
          let second = storyboard.instantiateViewController(withIdentifier: "neko")as! Page5ViewController
          //ここが実際に移動するコードとなります
          self.navigationController?.pushViewController(second, animated: true)
    }
    
    
    @IBAction func ongakuButton(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
          let storyboard: UIStoryboard = self.storyboard!
          //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
          let second = storyboard.instantiateViewController(withIdentifier: "ongaku")as! Page6ViewController
          //ここが実際に移動するコードとなります
          self.navigationController?.pushViewController(second, animated: true)
    }
    
    @IBAction func comicButton(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
          let storyboard: UIStoryboard = self.storyboard!
          //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
          let second = storyboard.instantiateViewController(withIdentifier: "comic")as! Page7ViewController
          //ここが実際に移動するコードとなります
          self.navigationController?.pushViewController(second, animated: true)
    }
    
    
    @IBAction func ryouriButton(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
          let storyboard: UIStoryboard = self.storyboard!
          //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
          let second = storyboard.instantiateViewController(withIdentifier: "ryouri")as! Page8ViewController
          //ここが実際に移動するコードとなります
          self.navigationController?.pushViewController(second, animated: true)
    }
    
    
    
    
    
}


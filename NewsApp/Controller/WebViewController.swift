//
//  WebViewController.swift
//  NewsApp
//
//  Created by 茶谷美咲 on 2020/09/25.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//

import UIKit
//Web Kit  アプリ内でWebが表示できるようにするもの
import WebKit

class WebViewController: UIViewController,WKUIDelegate {
    
//    Webビューをコードで生成する
    var webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //    サイズを決める
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 50)
//        webViewをくっつける
        view.addSubview(webView)
//        urlのキー値で保存されているものを入れる
        let urlString = UserDefaults.standard.object(forKey: "url")
//        文字列型をURL型に変更する
        let url = URL(string: urlString as! String)
        let request = URLRequest(url: url!)
        webView.load(request)
        
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

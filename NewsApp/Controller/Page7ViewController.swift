//
//  Page7ViewController.swift
//  NewsApp
//
//  Created by 茶谷美咲 on 2020/09/26.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//   https://news.yahoo.co.jp/rss/media/nataliec/all.xml

//Page1〜8ViewContollerは全てrssパースを行うためにコントローラー

import UIKit
//必要？　①SegementSlideはScrollViewを使うための外部ライブラリ
import SegementSlide
//②egementSlideContentScrollViewDelegateを入れる
class Page7ViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate {
    
    
    //　12. XMLParserのインスタンスを作成する
    var parser = XMLParser()
    
    //　16.rssのパース中の現在の要素名（変数）
    var currentElementName:String!
    //    NewsItemというモデムをSwiftFileで作って変数を用意する
    var newsItems = [NewsItems]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //     ④　TableViewを整えてあげる、背景クリア
        tableView.backgroundColor = .clear
        //　　　⑥  画像をtableViewの下に置く
        //     ⑤　画像を入れる(namedでAssets内のものを入れる
        let image = UIImage(named: "7")
        //     ⑦　画像のサイズを記載
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height))
        //     ⑧　画像を反映
        imageView.image = image
        //     ⑨backgroundViewにimageViewを反映してあげる
        self.tableView.backgroundView = imageView
        
        /*XMLパース
         
         yahoo(keyがいらない)　rss一覧からurlを抜き取る
         https://news.yahoo.co.jp/rss
         */
        //      ⑩ urlを入れる
        let urlString = "https://news.yahoo.co.jp/rss/media/nataliec/all.xml"
        //      11. urlStringの文字列をString型からURL型に変更してURLという変数の中に入れる
        let url:URL = URL(string: urlString)!
        //      13.
        parser = XMLParser(contentsOf: url)!
        //       14. parser.delegeteを自分に持ってくる
        parser.delegate = self
        //       15. parseを開始する
        parser.parse()
        
    }
    //    ③TableViewを返す必要がある。　プロトコル確認
    @objc var scrollView: UIScrollView{
        
        return tableView
        
    }
    
    // MARK: - Table view data source
    //   コメントアウトを解除して、セクションの数が1だからreturnで返してあげる
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //    1セクション中のセルの数はneweItemsのcount
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    //    TableViewのセルのたかさを5分割したセルのたかさを設定する
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/5
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // sellがsubtitleにすることで2列に表記される
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        //        WebviewContllerにURLを渡して、表示させたい
        //        セルのバックグラウンドカラーを透明にする
        cell.backgroundColor = .clear
        //　パースが完了して要素が入ってきているのをnewsItemsに入れている
        let newsItem = self.newsItems[indexPath.row]
        //        セルの書式決めコード
        cell.textLabel?.text = newsItem.title
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        cell.textLabel?.textColor = .white
        //　　numberOfLines 行数を設定
        cell.textLabel?.numberOfLines = 3
        
        cell.detailTextLabel?.text = newsItem.url
        cell.detailTextLabel?.textColor = .white
        
        
        return cell
    }
    
    //    パースの設定
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        //        上で宣言したcurrentElementNameをnilにする
        currentElementName =  nil
        //        もしelementNameに入ってきている値がアイテムなら
        if elementName == "item"{
            //            NewsItemsにappendする
            self.newsItems.append(NewsItems())
            
        }else{
            
            currentElementName = elementName
            
        }
        
        
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        /*    URLを参照渡しする
         count > 0 nil
         
         */
        
        if self.newsItems.count > 0 {
            let lastItem = self.newsItems[self.newsItems.count - 1]
            if self.currentElementName == "title" {
                if lastItem.title == nil {
                    lastItem.title = string
                }
                
            }
            if self.currentElementName == "link" {
                if lastItem.url == nil {
                    lastItem.url = string
                }
            }
            if self.currentElementName == "pubData" {
                if  lastItem.pubDate == nil {
                    
                    lastItem.pubDate = string
                }
            }
        }
    }
    
    
    
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        self.currentElementName = nil
        
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        
        self.tableView.reloadData()
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //WebViewContorllerにurlを渡して、表示したい
        let webViewController = WebViewController()
        //        modalで遷移する時のトランジション
        webViewController.modalTransitionStyle = .crossDissolve
        //        Newsアイテムの何番目を拾ってくるかを記載　セルがタップされた番号
        let newsItem = newsItems[indexPath.row]
        //        URLが欲しいからUser DefautにSetする
        UserDefaults.standard.set(newsItem.url, forKey: "url")
        //        webViewControllerで返してあげる
        present(webViewController, animated: true, completion: nil)
        
        
    }
    
}

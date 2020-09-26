//
//  Page6ViewController.swift
//  NewsApp
//
//  Created by 茶谷美咲 on 2020/09/26.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//


import UIKit
import SegementSlide

class Page6ViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate {
    
    
    //XMLParserのインスタンスを作成する
    var parser = XMLParser()
    
    //RSSのパース中の現在の要素名
    var currentElementName:String!
    
    var newsItems = [NewsItems]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .clear
        //画像をtableViewの下に置く
        
        let image = UIImage(named: "1")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height))
            
        imageView.image = image
        self.tableView.backgroundView = imageView
        
        //XMLパース
        let urlString = "https://news.yahoo.co.jp/rss/media/natalien/all.xml"
        let url:URL = URL(string: urlString)!
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
        
    }
    
    @objc var scrollView: UIScrollView{
        
        return tableView
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsItems.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height/5
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//        WebviewContllerにURLを渡して、表示させたい
        
        cell.backgroundColor = .clear
        
        let newsItem = self.newsItems[indexPath.row]
        
        cell.textLabel?.text = newsItem.title
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        cell.textLabel?.textColor = .white
        cell.textLabel?.numberOfLines = 3
        
        cell.detailTextLabel?.text = newsItem.url
        cell.detailTextLabel?.textColor = .white
        
        
        return cell
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElementName =  nil
        if elementName == "item"{
            
            self.newsItems.append(NewsItems())
            
            //[,,]
            
        }else{
            
            currentElementName = elementName
            
        }
        
        
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if self.newsItems.count > 0{
            
            //[1]
            let lastItem = self.newsItems[self.newsItems.count - 1]
            
            switch self.currentElementName{
                
            case "title":
                lastItem.title = string
            
            case "link":
                lastItem.url = string
                
            case "pubDate":
                lastItem.pubDate = string
            default:break
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

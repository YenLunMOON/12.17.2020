//
//  ViewController.swift
//  12.17.2020
//
//  Created by 周宴綸 on 2020/12/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageViews: [UIImageView]!
    
    //在程式跑起來的時候...
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...1{
            //設定圖片為loading，避免抓圖抓太久畫面一片空白
            let image = UIImage(named: "loading")
            self.imageViews[i].image = image
        }
        for i in 0...1 {
            //從網路免費隨機圖片api抓圖
            let urlStr = "https://picsum.photos/200"
            if let url = URL(string: urlStr) {
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data,
                       let image = UIImage(data: data){
                        //將此任務丟到main thread(因為所有的畫面更動都要在main thread執行)
                        DispatchQueue.main.async {
                            self.imageViews[i].image = image
                        }
                    }
                }.resume()//執行
            }
        }
    }
    
}


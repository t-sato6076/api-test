//
//  ViewController.swift
//  Resen Lekord
//
//  Created by Tatsuya on 2016/02/12.
//  Copyright © 2016年 Tatsuya. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "https://app.rakuten.co.jp/services/api/BooksTotal/Search/20130522?format=json&keyword=swift&booksGenreId=000&applicationId=d7647b803877a9348e959243fdb02fa4")
        
        
        
        let request = NSURLRequest(URL: url!)

        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration, delegate:nil, delegateQueue:NSOperationQueue.mainQueue())
        
        let task = session.dataTaskWithRequest(request, completionHandler: {
            (data, response, error) -> Void in
            do {
                if data != nil {
                    var json = JSON(data: data!)
                    var title = json["Items"][0]["Item"]["title"].string
                    
//                    print(title)
//                    self.label.text = title
                }
            }
            
        })
        
        task.resume()
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        print("\(title)")
        
        cell.textLabel?.text = title
        
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  CustomsizeCell
//
//  Created by happts on 2019/8/30.
//  Copyright © 2019 happts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [ CellInfo(title: "第一条", comments: []),
                 CellInfo(title: "第二条", comments: ["评论1","评论2"]),
                 CellInfo(title: "第三条", comments: ["onew","asdf","asdfasdfasd"])
    ]

    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.autoresizesSubviews = false
            self.tableView.register(MyCell.self, forCellReuseIdentifier: MyCell.reuseID)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.row].comments.append("新添了一条评论")
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCell.reuseID, for: indexPath) as! MyCell
        let a = cell
        a.stackview.subviews.forEach{$0.removeFromSuperview()}
        data[indexPath.row].comments.forEach{ comment in a.stackview.addArrangedSubview(a.initComment(text: comment))}
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
}


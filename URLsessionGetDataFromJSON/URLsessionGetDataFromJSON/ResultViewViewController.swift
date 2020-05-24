//
//  ResultViewViewController.swift
//  URLsessionGetDataFromJSON
//
//  Created by Luong Quang Huy on 5/25/20.
//  Copyright © 2020 Luong Quang Huy. All rights reserved.
//

import UIKit
protocol GetDataDelegate: AnyObject{
    var data: Response?{get}
}

class ResultViewViewController: UIViewController {
    weak var getDataDelegate: GetDataDelegate?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tableView.rowHeight = 150
    }
    

    
}

extension ResultViewViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemsCount = getDataDelegate?.data?.items.count else {return 0}
        return itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCellTableViewCell
        guard let item = getDataDelegate?.data?.items[indexPath.row] else {
            let defaultCell = CustomCellTableViewCell()
            defer{
                defaultCell.title.text = "nil"
                defaultCell.score.text = "nil"
                defaultCell.tags.text = "nil"
                defaultCell.answerCount.text = "nil"
                defaultCell.link.text = "nil"
            }
            return defaultCell
        }
        
        cell.link.text = item.link
        cell.score.text = String(item.score)
        cell.answerCount.text = String(item.answerCount)
        cell.tags.text = item.tags.joined()
        return cell
    }
    
    
}


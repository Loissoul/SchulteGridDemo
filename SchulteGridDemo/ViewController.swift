//
//  ViewController.swift
//  SchulteGridDemo
//
//  Created by Lois_pan on 2017/12/29.
//  Copyright © 2017年 Lois_pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let coutArr = [DataModel(title: "2x2", numS: 4),
                   DataModel(title: "3X3", numS: 9),
                   DataModel(title: "5X5", numS: 25),
                   DataModel(title: "6X6", numS: 36),
                   DataModel(title: "7X7", numS: 49)]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.frame = CGRect(x:0, y:0, width:self.view.frame.size.width,  height:self.view.frame.size.height)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coutArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let dataModel = self.coutArr[indexPath.row]
        cell.textLabel?.text = dataModel.title
        cell.detailTextLabel?.textColor = .gray
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let dataModel = self.coutArr[indexPath.row]
        
        let vc = SchulteGridViewController(count:dataModel.numS)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}





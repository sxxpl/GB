//
//  ViewController.swift
//  test
//
//  Created by Артем Тихонов on 05.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView (frame: CGRect(x: 0, y: 0, width: 0, height: 0))

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*(3/4))
        view.addSubview(scrollView)
        let tableView = UITableView()
        tableView.numberOfRows(inSection: 10)
        scrollView.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.contentSize = CGSize(width: view.frame.width, height: view.frame.height*(3/4))
        
    }


}


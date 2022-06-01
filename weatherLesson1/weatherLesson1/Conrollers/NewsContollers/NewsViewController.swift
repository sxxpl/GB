//
//  NewsViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 01.06.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
    }
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints=false
        return tableView
    }()
    
}


extension NewsViewController{
    func setupTableView(){
        tableView.backgroundColor = #colorLiteral(red: 0.9593362212, green: 0.9628924727, blue: 0.9751229882, alpha: 1)
        tableView.frame=self.view.bounds
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AuthorTableViewCell", bundle: nil), forCellReuseIdentifier: "AuthorTableViewCell")
        tableView.register(UINib(nibName: "TextTableViewCell", bundle: nil), forCellReuseIdentifier: "TextTableViewCell")
        tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoTableViewCell")
        tableView.register(UINib(nibName: "LikeTableViewCell", bundle: nil), forCellReuseIdentifier: "LikeTableViewCell")
        view.addSubview(tableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
            
        ])
    }
}


extension NewsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorTableViewCell",for: indexPath) as? AuthorTableViewCell else
            {
                return UITableViewCell()
            }
            cell.authorImage?.image = UIImage(named: "rus")
            cell.authorLabel?.text = "author"
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell") as? TextTableViewCell else
            {
                return UITableViewCell()
            }
            cell.cellTextLabel?.text = "text"
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell") as? PhotoTableViewCell else
            {
                return UITableViewCell()
            }
            cell.cellImage?.image = UIImage(named: "rus")
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikeTableViewCell") as? LikeTableViewCell else
            {
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
}

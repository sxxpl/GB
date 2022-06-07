//
//  NewsViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 01.06.2022.
//

import UIKit
import RealmSwift

class NewsViewController: UIViewController {
    
    let service = VKService()
    var VKNewsModel: VKNews?
    var news = [News]()
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints=false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        loadNews()
    }
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
    
    private func loadNews(){
        service.getNews(completion:{ [weak self] result in
            switch result {
            case .success(let news):
                DispatchQueue.main.async {
                    self?.VKNewsModel = news
                    self?.infoTransform()
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func infoTransform(){
        for item in VKNewsModel?.response?.items ?? List<NewsItems>() {
            self.news.append(News(countOfLikes: item.likes?.count ?? 0, text: item.text,image: UIImage(named: "rus") ?? UIImage()))
        }
    }
}


extension NewsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func configure(_ indexPath:IndexPath) -> UITableViewCell{
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorTableViewCell",for: indexPath) as? AuthorTableViewCell else
            {
                return UITableViewCell()
            }
            cell.configure(authorImage: UIImage(named: "rus") ??  UIImage(),authorLabel: "author")
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell") as? TextTableViewCell else
            {
                return UITableViewCell()
            }
            cell.configure(cellTextLabel: news[indexPath.section].text)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell") as? PhotoTableViewCell else
            {
                return UITableViewCell()
            }
            cell.configure(cellImage: news[indexPath.section].image)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikeTableViewCell") as? LikeTableViewCell else
            {
                return UITableViewCell()
            }
            cell.configure(numberOfLikes: news[indexPath.section].countOfLikes)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return configure(indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return news.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
}

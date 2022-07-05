//
//  TextTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 01.06.2022.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var cellTextLabel: UILabel?
    private var showMoreFlag = true
    weak var tableView:UITableView?
    var indexPath:IndexPath?
//    private var tableViewClouser:(()->Void)
    
    func configure(cellTextLabel: String,tableView:UITableView,indexPath:IndexPath){
        self.cellTextLabel?.text = cellTextLabel
        self.tableView = tableView
        self.indexPath = indexPath
    }
    

    
    
    @available(iOS 15.0, *)
    @IBAction func showMore(_ sender: Any) {
        if showMoreFlag {
            showMoreFlag.toggle()
            DispatchQueue.main.async {
                self.cellTextLabel?.numberOfLines = 0
                self.showMoreButton.configuration?.title = "Свернуть"
                self.tableView?.reloadSections(IndexSet(self.indexPath ?? IndexPath()), with: .automatic)
            }
        } else {
            showMoreFlag.toggle()
            DispatchQueue.main.async {
                self.cellTextLabel?.numberOfLines = 4
                self.showMoreButton.configuration?.title = "Показать полностью..."
                self.tableView?.reloadSections(IndexSet(self.indexPath ?? IndexPath()), with: .none)
            }
        }
    }
}

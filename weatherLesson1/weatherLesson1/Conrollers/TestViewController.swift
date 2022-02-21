//
//  TestViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 16.02.2022.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TestViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lol", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
//         content.text = "123"
//        content.textProperties.font = UIFont(name: "Kefa", size: 30)
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}

//
//  WeatherViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 14.02.2022.
//

import UIKit
import WebKit

class WeatherViewController: UIViewController {
    
    
    @IBOutlet weak var personEMail: UITextField!
    @IBOutlet weak var personPassWord: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
        view.addGestureRecognizer(tapGR)
    }
    
    @objc func hideScreen() {
        view.endEditing(true)
    }
 
    override func viewWillAppear(_ animated: Bool) {
//        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func enterFunc(_ sender: Any) {
        guard personEMail.text != "",
        personPassWord.text != ""
        else {
            let alertVC = UIAlertController(title: "Вы не ввели данные!", message: "Попробуйте снова.", preferredStyle: .alert)
            let actionVC = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alertVC.addAction(actionVC)
            self.present(alertVC, animated: true, completion: nil)
            personEMail.text = ""
            personPassWord.text = ""
            return
        }
        
        let nextViewContoller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabBarContoller") as! MainTabBarContoller
        navigationController?.pushViewController(nextViewContoller, animated: true)
    }
    //    @objc func willShowKeyboard(_ notification: Notification){
//        print(#function)
//    }
//
//    @objc func willHideKeyboard(_ notification: Notification){
//        print(#function)
//
////        let alertVC = UIAlertController(title: "Error", message: "asd", preferredStyle: .alert)
////        let actionVC = UIAlertAction(title: "Close", style: .default, handler: nil)
////        alertVC.addAction(actionVC)
//    }
//
}




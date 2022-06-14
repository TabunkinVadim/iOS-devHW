//
//  InfoViewController.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Info"
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let alertButton = UIButton(frame: CGRect(x: 0, y: 0, width: screenWidth - 20, height: screenHeight / 9))
        alertButton.setTitle("Alert", for: .normal)
        alertButton.setTitleColor(.blue, for: .normal)
        alertButton.layer.cornerRadius = 10
        alertButton.layer.borderWidth = 1
        alertButton.addTarget(self, action: #selector(pressAlertButtom), for: .touchUpInside)
        self.view.addSubview(alertButton)
        
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        let bottomAnchor = alertButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        let leftAnchor = alertButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        let rightAnchor = alertButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        
        NSLayoutConstraint.activate([bottomAnchor, leftAnchor, rightAnchor])
    }
    
    @objc func pressAlertButtom(_ sender:Any) {
        let pressAlertButtom = UIAlertController(title: "Alert", message: "Внимание", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: {_ in print("Отмена")})
        pressAlertButtom.addAction(cancelAction)
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive, handler: {_ in print("Удалить")})
        pressAlertButtom.addAction(deleteAction)
        present(pressAlertButtom, animated: true, completion: nil)
    }
}

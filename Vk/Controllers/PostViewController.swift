//
//  PostViewController.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = newPost.title
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(infoButtom(_:)))

    }
    @objc func infoButtom(_ sender:Any) {
        let infoNC = UINavigationController(rootViewController: InfoViewController())
        present(infoNC, animated: true, completion: .none)
    }
}

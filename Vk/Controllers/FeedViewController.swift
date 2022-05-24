//
//  FeedViewController.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let postsStack: UIStackView = {
          let stack = UIStackView()
          stack.axis = .vertical
          stack.distribution = .fillEqually
          stack.spacing = 10
          return stack
      }()

    let postButton1: UIButton = {
        let buttom = UIButton()
        buttom.backgroundColor = .systemGray4
        buttom.layer.cornerRadius = 10
        buttom.layer.borderWidth = 1
        buttom.setTitle(newPost.title + " 1", for: .normal)
        buttom.setTitleColor(.black, for: .normal)
        buttom.addTarget(self, action: #selector(pressFeedButtom), for: .touchUpInside)
        return buttom
    }()

       let postButton2: UIButton = {
           let buttom = UIButton()
           buttom.backgroundColor = .systemGray4
           buttom.layer.cornerRadius = 10
           buttom.layer.borderWidth = 1
           buttom.setTitle(newPost.title + " 2", for: .normal)
           buttom.setTitleColor(.black, for: .normal)
           buttom.addTarget(self, action: #selector(pressFeedButtom), for: .touchUpInside)
           return buttom
       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Feed"
        layoutSubviews()
    }

    @objc func pressFeedButtom(_ sender:Any) {
        navigationController?.pushViewController( PostViewController(), animated: true)
    }
    
    private func layoutSubviews(){
        view.addSubview(postsStack)
        postsStack.toAutoLayout()
        NSLayoutConstraint.activate([
            postsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            postsStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            postsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            postsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        postsStack.addArrangedSubview(postButton1)
        postsStack.addArrangedSubview(postButton2)
    }
}

let newPost = Post(author: "News", image: "", description: "", likes: 10, views: 10, title: "Новости")

//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Табункин Вадим on 13.03.2022.
//

import UIKit

class ProfileHeaderView:UITableViewHeaderFooterView  {
    private var statusText: String = ""

    let avatarView: UIView = {
        $0.toAutoLayout()
        $0.layer.cornerRadius = 50
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.masksToBounds = true
        $0.backgroundColor = .blue
        return $0
    }(UIView())

    var avatar: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = true
        image.image = UIImage(named: "Avatar")
        return image
    }()

     var avatarTop = NSLayoutConstraint()
     var avatarLeading = NSLayoutConstraint()
     var avatarHeight = NSLayoutConstraint()
     var avatarWidth = NSLayoutConstraint()

    let name: UILabel = {
        let lable = UILabel()
        lable.toAutoLayout()
        lable.font = UIFont.boldSystemFont(ofSize: 18)
        lable.textColor = .black
        lable.text = "Иван Иванович"
        return lable
    }()
    
    let statusButtom: UIButton = {
        let buttom = UIButton(frame: CGRect(x: 16, y: 116, width: 200, height: 50))
        buttom.toAutoLayout()
        buttom.backgroundColor = .blue
        buttom.setTitle("Show status", for: .normal)
        buttom.setTitleColor(.white, for: .normal)
        buttom.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttom.layer.shadowRadius = 4
        buttom.layer.shadowColor = UIColor.black.cgColor
        buttom.layer.shadowOpacity = 0.7
        buttom.layer.cornerRadius = 4
        buttom.addTarget(self, action: #selector(pressStatusButtom), for: .touchUpInside)
        return buttom
    }()
    
    let status: UILabel = {
        let lable = UILabel(frame: CGRect(x: 100, y: 400, width: 200, height: 40))
        lable.toAutoLayout()
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.text = "Я в шоке..."
        lable.textColor = .gray
        return lable
    }()
    
    
    lazy var statusSet: UITextField = {
        let field = UITextField()
        field.toAutoLayout()
        field.font = UIFont.systemFont(ofSize: 15)
        field.textColor = .black
        field.backgroundColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: field.frame.height))
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: field.frame.height))
        field.leftViewMode = .always
        field.rightViewMode = .always
        field.delegate = self
        field.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return field
    }()
    
    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pressStatusButtom(_ sender:Any) {
        status.text = statusText
        print(status.text ?? "Статус отсутствует")
    }

    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? ""
    }

    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        contentView.addSubviews(avatarView, name, statusButtom, status, statusSet)

        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarView.heightAnchor.constraint(equalToConstant: 100),
            avatarView.widthAnchor.constraint(equalToConstant: 100)
        ])
        avatarView.addSubview(avatar)
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: avatarView.topAnchor),
            avatar.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor),
            avatar.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor),
            avatar.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            statusButtom.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            statusButtom.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButtom.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            status.bottomAnchor.constraint(equalTo: statusSet.topAnchor, constant: -10),
            status.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            status.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            statusSet.bottomAnchor.constraint(equalTo: statusButtom.topAnchor, constant: -8),
            statusSet.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            statusSet.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusSet.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension ProfileHeaderView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        pressStatusButtom(endEditing(true))
        return true
    }
}



//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.03.2022.
//

import UIKit
class ProfileViewController: UIViewController {

    var header: ProfileHeaderView = ProfileHeaderView(reuseIdentifier: ProfileHeaderView.identifier)


    func setupGesture() {
        header.avatarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (tapAvatar)))
        header.avatarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (blureViewAnimate)))
    }

    //анимация Фона
    @objc  func blureViewAnimate() {
        tapAvatar()
        let blureView: UIView = {
            $0.toAutoLayout()
            $0.backgroundColor = .white
            $0.alpha = 0
            return $0
        }(UIView())

        view.insertSubview(blureView, at: view.subviews.count-1)

        NSLayoutConstraint.activate([
            blureView.topAnchor.constraint(equalTo: view.topAnchor),
            blureView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blureView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blureView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        let undoButtom:UIButton = {
            $0.toAutoLayout()
            $0.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
            $0.tintColor = UIColor(named: "MainColor")
            $0.contentVerticalAlignment = .fill
            $0.contentHorizontalAlignment = .fill
            $0.alpha = 0
            return $0
        }(UIButton())

        blureView.addSubview(undoButtom)
        NSLayoutConstraint.activate([
            undoButtom.topAnchor.constraint(equalTo: blureView.safeAreaLayoutGuide.topAnchor, constant: 15),
            undoButtom.trailingAnchor.constraint(equalTo: blureView.trailingAnchor, constant: -15),
            undoButtom.heightAnchor.constraint(equalToConstant: 50),
            undoButtom.widthAnchor.constraint(equalToConstant: 50)
        ])

        UIView.animate(withDuration: 0.5) {
            blureView.alpha = 0.8} completion: { _ in
                UIView.animate(withDuration: 0.3){
                    undoButtom.alpha = 1
                }
            }
    }

    //анимация фото
    @objc  func tapAvatar() {
        var avatarTop = NSLayoutConstraint()
        var avatarLeading = NSLayoutConstraint()
        var avatarHeight = NSLayoutConstraint()
        var avatarWidth = NSLayoutConstraint()


        let avatarView: UIView = {
            $0.toAutoLayout()
            $0.layer.cornerRadius = 50
            $0.layer.borderWidth = 3
            $0.layer.borderColor = UIColor.white.cgColor
            $0.layer.masksToBounds = true
            $0.backgroundColor = .blue
            return $0
        }(UIView())

        view.insertSubview(avatarView, at: view.subviews.count)

        let avatar: UIImageView = {
            let image = UIImageView()
            image.toAutoLayout()
            image.layer.cornerRadius = 50
            image.layer.borderWidth = 3
            image.layer.borderColor = UIColor.white.cgColor
            image.layer.masksToBounds = true
            image.image = UIImage(named: "Avatar")
            return image
        }()

        avatarView.addSubview(avatar)

        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: avatarView.topAnchor),
            avatar.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor),
            avatar.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor),
            avatar.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor)
        ])

        avatarTop = avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        avatarLeading = avatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        avatarHeight = avatarView.heightAnchor.constraint(equalToConstant: 100)
        avatarWidth = avatarView.widthAnchor.constraint(equalToConstant: 100)

        NSLayoutConstraint.activate([
            avatarTop,
            avatarLeading,
            avatarHeight,
            avatarWidth
        ])

        UIView.animate(withDuration: 0.5){
            avatarTop.constant = UIScreen.main.bounds.midY - UIScreen.main.bounds.width / 2
            avatarLeading.constant = 0
            avatarWidth.constant = self.view.bounds.width
            avatarHeight.constant = avatarWidth.constant
            self.view.layoutIfNeeded()
        }

        //
        //        let avatarAnimate = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        ////        avatarAnimate.timingFunctionm =  CAMediaTimingFunction(name: .easeIn)
        //        avatarAnimate.fromValue = header.avatar.center
        //        avatarAnimate.toValue = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        ////        avatarAnimate.
        //
        //        let groupAnimation = CAAnimationGroup()
        //        groupAnimation.duration = 0.5
        ////        groupAnimation
        //
        //        groupAnimation.animations = [avatarAnimate]
        //        groupAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        //        avatarView.layer.add(groupAnimation, forKey: nil)
        //        avatarView.layer.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        //
        //        avatarView.transform = CGAffineTransform(translationX:  UIScreen.main.bounds.midX - 66, y: UIScreen.main.bounds.midY - 66).scaledBy(x: UIScreen.main.bounds.width/100, y: UIScreen.main.bounds.width/100)
        ////        avatarView.transform = CGAffineTransform(scaleX: 1000/UIScreen.main.bounds.width, y: 1000/UIScreen.main.bounds.width)

    }

    private lazy var tableView: UITableView = {
        $0.toAutoLayout()
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .systemGray6
        $0.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifier)
        $0.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return $0
    }(UITableView(frame: .zero, style: .grouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Profile"
        layout()
        setupGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func layout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

    }
    
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberRows = 0
        if section == 0 {
            numberRows = 1
        } else {
            numberRows = posts.count
        }
        return numberRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            var cell: PhotosTableViewCell
            cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            var cell: PostTableViewCell
            cell = (tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier , for: indexPath) as! PostTableViewCell)
            cell.setupCell(model: posts[indexPath.row])
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        //        var header:UIView? = nil
        //        func setupGesture() {
        //            let tapGesture = UITapGestureRecognizer(target: self, action: #selector (tapAvatar))
        //            header?.avatar.addGestureRecognizer(tapGesture)
        //       }
        if section == 0 {
            //            header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifier)
            //            header = ProfileHeaderView(reuseIdentifier: ProfileHeaderView.identifier)
            //            header.avatarView.addGestureRecognizer(<#T##gestureRecognizer: UIGestureRecognizer##UIGestureRecognizer#>)
            //            setupGesture()
            //            self.view.layoutIfNeeded()
        }
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 200
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var autiHeight:CGFloat {
            UITableView.automaticDimension
        }
        return autiHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let _:PhotosViewController = {
                navigationController?.pushViewController($0, animated: true)
                return $0
            }(PhotosViewController())
        }
    }
}


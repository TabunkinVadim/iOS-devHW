//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.03.2022.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {

    weak var coordinator: ProfileCoordinator?
    
    var header: ProfileHeaderView = ProfileHeaderView(reuseIdentifier: ProfileHeaderView.identifier)

    private var counterSetAvatar = 0
    private var counter = 5
    private lazy var tableView: UITableView = {
        $0.toAutoLayout()
        $0.dataSource = self
        $0.delegate = self
        
        #if DEBUG
        $0.backgroundColor = .red
        #else
        $0.backgroundColor = .systemGray6
        #endif
        
        $0.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifier)
        $0.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return $0
    }(UITableView(frame: .zero, style: .grouped))
    
    var userLogin: UserService
    var user: User

    init (user: UserService, name: String) {
        userLogin = user
        self.user = user.setUser(fullName: name) ?? User(fullName: "", avatar: UIImage(), status: "")

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createTimerSetAvatar()
        layout()
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

    var timerSetAvatar: Timer?

    private func createTimerSetAvatar() {
        DispatchQueue.global().async {
            self.timerSetAvatar = Timer.scheduledTimer(timeInterval: 1,
                                                       target: self,
                                                       selector: #selector(self.timerActionSetAvatar),
                                                       userInfo: nil,
                                                       repeats: true)
            guard let timer = self.timerSetAvatar else { return }
            timer.tolerance = 0.2
            RunLoop.current.add(timer, forMode: .common)
            RunLoop.current.run()
        }
    }

    @objc func timerActionSetAvatar() {
        if counter == 0 {
            if self.counterSetAvatar < photoGallery2.count {
                DispatchQueue.main.async {
                    print(self.counterSetAvatar)
                    self.header.timer.text = String(5)
                    self.header.avatar.image = photoGallery2[self.counterSetAvatar]
                    self.counterSetAvatar += 1
                    self.counter = 4
                }
            } else {
                DispatchQueue.main.async {
                    self.header.avatar.image = self.user.avatar
                    self.counter = 5
                    self.header.timer.text = String(self.counter)
                    self.counter -= 1
                    self.counterSetAvatar = 0
                    return
                }
            }
        } else {
            DispatchQueue.main.async{
                print(self.counterSetAvatar)
                self.header.timer.text = String(self.counter)
                self.counter -= 1
            }
        }
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
            cell.setupCell(model: posts[indexPath.row], set: indexPath.row)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            header.avatar.image = user.avatar
            header.name.text = user.fullName
            header.status.text = user.status
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
            coordinator?.photoVC()
        }
    }
}


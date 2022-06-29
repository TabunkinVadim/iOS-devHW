//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.04.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {

    weak var coordinator: ProfileCoordinator?

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame:.zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .none
        collection.register(ProfilePhotoCollectionViewCell.self, forCellWithReuseIdentifier: ProfilePhotoCollectionViewCell.identifier)
        collection.toAutoLayout()
        return collection
    }()

    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(unsubscribe(_:)))
        title = "Photo Gallery"
        view.backgroundColor = .white
        super.viewDidLoad()
        layout()
        imageFasade.subscribe(self)
        setFasade
    }

    @objc func unsubscribe(_ sender:Any) {
        imageFasade.removeSubscription(for: self)
    }

    func layout() {
        view.addSubviews(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PhotosViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    static var indent:CGFloat  {
        8
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        incominginImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfilePhotoCollectionViewCell.identifier, for: indexPath) as! ProfilePhotoCollectionViewCell
        cell.imageView.image = incominginImages[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 4 * PhotosViewController.indent) / 3
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        PhotosViewController.indent
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: PhotosViewController.indent, left: PhotosViewController.indent, bottom: PhotosViewController.indent, right: PhotosViewController.indent)
    }

}
extension PhotosViewController: ImageLibrarySubscriber{
    func receive(images: [UIImage]) {
        collectionView.reloadData()
    }
}

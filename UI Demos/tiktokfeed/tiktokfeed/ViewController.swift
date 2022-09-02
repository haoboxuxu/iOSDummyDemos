//
//  ViewController.swift
//  tiktokfeed
//
//  Created by 徐浩博 on 2022/8/17.
//

import UIKit

struct VideoModel {
    let caption: String
    let userName: String
    let audioTrackName: String
    let videoFileName: String
    let videoFormatName: String
}

class ViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    private var data:[VideoModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<10 {
            let model = VideoModel(caption: "Better call Bat", userName: "haoboxx",
                                   audioTrackName: "bat music", videoFileName: "v", videoFormatName: "mov")
            data.append(model)
        }
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView?.isPagingEnabled = true
        collectionView?.dataSource = self
        self.view.addSubview(collectionView!)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView?.frame = view.bounds
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier,
                                                      for: indexPath) as! CollectionViewCell
        cell.config(with: model)
        return cell
    }
}

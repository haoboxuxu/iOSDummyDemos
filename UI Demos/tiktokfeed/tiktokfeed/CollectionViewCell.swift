//
//  CollectionViewCell.swift
//  tiktokfeed
//
//  Created by 徐浩博 on 2022/8/17.
//

import UIKit
import AVFoundation

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    var player: AVPlayer?
    private var model: VideoModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(with model: VideoModel) {
        self.model = model
        configVideo()
    }
    
    func configVideo() {
        guard let model = model else { return }
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFormatName) else {
            return
        }
        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        
        contentView.layer.addSublayer(playerView)
        player?.volume = 0
        player?.play()
    }
}

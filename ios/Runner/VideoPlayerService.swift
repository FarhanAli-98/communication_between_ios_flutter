//
//  VideoPlayerService.swift
//  VideoFeedsDemo
//
//  Created by Hannan Khan on 02/04/2024.
//

import UIKit
import AVFoundation
import Kingfisher

class VideoPlayerService: NSObject {
    
    // MARK: - Properties
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private var isLoopingEnabled: Bool = false
    
    // MARK: - Observers
    
    // MARK: - Public Methods
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private func addThumbnailView(in view: UIView, thumbnailUrl: String) {
        guard let url = URL(string: thumbnailUrl) else {return}
        self.imageView.kf.setImage(with: url)
        view.addSubview(imageView)
        view.bringSubviewToFront(imageView)
    }
    
    // MARK: - Initialization
    
    func configurePlayerView(frame: CGRect, from videoURL: URL, thumbnailImageUrl: String = "", loopingEnabled: Bool = false, cacheConfiguration: Bool = false, autoplay: Bool = true) -> UIView {
        let videoView = UIView(frame: frame)
        self.imageView.frame = videoView.bounds
        self.isLoopingEnabled = loopingEnabled
        var url = videoURL
        if cacheConfiguration {
            url = HLSVideoCache.shared.reverseProxyURL(from: videoURL)!
        }
        let playerItem = AVPlayerItem(url: url)
        
        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill
        playerLayer?.frame = videoView.bounds
        videoView.layer.addSublayer(playerLayer!)
        // Add observer for timeControlStatus
        self.addThumbnailView(in: videoView, thumbnailUrl: thumbnailImageUrl)
        player?.addObserver(self, forKeyPath: #keyPath(AVPlayer.timeControlStatus), options: [.new], context: nil)
        
        // Add notification observer for playback finish
        
        // Add notification observer for playback interruption
        
        // Add observer for progress
        
        // Notify initialized
        if autoplay {
            self.play()
        }
        return videoView
    }
    
    // MARK: - Playback Control
    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    func removeObservers() {
        player?.removeObserver(self, forKeyPath: #keyPath(AVPlayer.timeControlStatus))
    }
    
    // MARK: - KVO
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(AVPlayer.timeControlStatus) {
            if player?.timeControlStatus == .playing {
                self.imageView.removeFromSuperview()
            } else if player?.timeControlStatus == .paused {
            }
        }
    }
}


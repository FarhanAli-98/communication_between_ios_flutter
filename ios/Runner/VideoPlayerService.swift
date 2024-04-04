//
//  VideoPlayerService.swift
//  VideoFeedsDemo
//
//  Created by Hannan Khan on 02/04/2024.
//

import UIKit
import AVFoundation
import Kingfisher

protocol VideoPlayerServiceObserver: AnyObject {
    func videoPlayerServiceInitialized()
    func videoPlayerServicePlay()
    func videoPlayerServicePause()
    func videoPlayerServiceProgress(time: CMTime)
    func videoPlayerServiceFinished()
    func videoPlayerServiceException()
}

class VideoPlayerService: NSObject {
    
    // MARK: - Properties
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private var isLoopingEnabled: Bool = false
    private var isFinished: Bool = false
    weak var observers: VideoPlayerServiceObserver?
    
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
        self.isFinished = false
        let videoView = UIView(frame: frame)
        self.imageView.frame = frame
        self.isLoopingEnabled = loopingEnabled
        var url = videoURL
        if cacheConfiguration {
            url = HLSVideoCache.shared.reverseProxyURL(from: videoURL)!
        }
        let playerItem = AVPlayerItem(url: url)
        
        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill
        playerLayer?.frame = frame
        videoView.layer.addSublayer(playerLayer!)
        // Add observer for timeControlStatus
        self.addThumbnailView(in: videoView, thumbnailUrl: thumbnailImageUrl)
        player?.addObserver(self, forKeyPath: #keyPath(AVPlayer.timeControlStatus), options: [.new], context: nil)
        
        // Add notification observer for playback finish
        NotificationCenter.default.addObserver(
            self, selector: #selector(playerDidFinishPlaying(_:)),
            name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        
        // Add notification observer for playback interruption
        NotificationCenter.default.addObserver(
            self, selector: #selector(playerDidInterruptPlayback(_:)),
            name: .AVPlayerItemPlaybackStalled, object: player?.currentItem)
        
        // Add observer for progress
        player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: nil) { [weak self] time in
            self?.progress(time)
        }
        
        // Notify initialized
        notifyInitialized()
        if autoplay {
            self.play()
        }
        return videoView
    }
    
    func removeObservers() {
        player?.removeObserver(self, forKeyPath: #keyPath(AVPlayer.timeControlStatus))
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemPlaybackStalled, object: nil)
    }
    
    // MARK: - Playback Control
    
    func play() {
        player?.play()
        notifyPlay()
    }
    
    func pause() {
        player?.pause()
        notifyPause()
    }
    func restart() {
        self.isFinished = false
        player?.seek(to: CMTime.zero)
        player?.play()
    }
    
    // MARK: - Private Methods
    
    private func notifyInitialized() {
        observers?.videoPlayerServiceInitialized()
    }
    
    private func notifyPlay() {
        observers?.videoPlayerServicePlay()
    }
    
    private func notifyPause() {
        observers?.videoPlayerServicePause()
    }
    
    private func notifyProgress(time: CMTime) {
        observers?.videoPlayerServiceProgress(time: time)
    }
    
    @objc private func playerDidFinishPlaying(_ notification: Notification) {
        self.isFinished = true
        notifyFinished()
        guard isLoopingEnabled else { return }
        self.restart()
    }
    
    @objc private func playerDidInterruptPlayback(_ notification: Notification) {
        // Notify exception
        notifyException()
    }
    
    private func progress(_ time: CMTime) {
        notifyProgress(time: time)
    }
    
    private func notifyFinished() {
        observers?.videoPlayerServiceFinished()
    }
    
    private func notifyException() {
        observers?.videoPlayerServiceException()
    }
    
    // MARK: - KVO
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(AVPlayer.timeControlStatus) {
            if player?.timeControlStatus == .playing {
                self.imageView.removeFromSuperview()
                notifyPlay()
            } else if player?.timeControlStatus == .paused {
                if !self.isFinished {
                    notifyPause()
                }
            }
        }
    }
}


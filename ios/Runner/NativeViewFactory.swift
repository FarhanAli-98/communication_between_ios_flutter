////
////  NativeViewFactory.swift
////  Runner
////
////  Created by Rohit Nisal on 12/24/18.
////  Copyright © 2018 The Chromium Authors. All rights reserved.
////
//
//import Foundation
//import AVFoundation
//
//class NativeViewFactory : NSObject, FlutterPlatformViewFactory {
//    
//    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
//        return NativeView(frame, viewId:viewId, args:args)
//    }
//}
//
//public class NativeView : NSObject, FlutterPlatformView {
//    
//    private var player: AVPlayer?
//    private var playerLayer: AVPlayerLayer?
//    
//    let frame : CGRect
//    let viewId : Int64
//    
//    init(_ frame:CGRect, viewId:Int64, args: Any?){
//        self.frame = frame
//        self.viewId = viewId
//    }
//    
//    public func view() -> UIView {
//        let view = UIView(frame: self.frame)
//        view.backgroundColor = .clear
//        let url = URL(string: "https://stream.mux.com/EeHebcbvEDQcaKJMHwkk1Hr7Ortxelxb8mKD6kIttWE.m3u8")!
//        let playerItem = AVPlayerItem(url: url)
//        
//        player = AVPlayer(playerItem: playerItem)
//        playerLayer = AVPlayerLayer(player: player)
//        playerLayer?.videoGravity = .resizeAspectFill
//        playerLayer?.frame = self.frame
//        view.layer.addSublayer(playerLayer!)
//        player?.play()
//        return view
//    }
//    
//    func configure() {
//        
//    }
//    
//}
//extension NativeView: VideoPlayerServiceObserver {
//    func videoPlayerServiceInitialized() {
//        print("Testing")
//    }
//    
//    func videoPlayerServicePlay() {
//        print("Testing")
//    }
//    
//    func videoPlayerServicePause() {
//        print("Testing")
//    }
//    
//    func videoPlayerServiceProgress(time: CMTime) {
//        print(time)
//    }
//    
//    func videoPlayerServiceFinished() {
//        print("Testing")
//    }
//    
//    func videoPlayerServiceException() {
//        print("Testing")
//    }
//}

//
//  PlayerArgs.swift
//  Runner
//
//  Created by Hannan Khan on 04/04/2024.
//

import Foundation

class PlayerArgs: NSObject {
    var videoUrl: String
    var thumbnailUrl: String
    var cacheConfiguration: Bool
    var autoPlay: Bool
    var islooping: Bool
    init(videoUrl: String = "", thumbnailUrl: String = "", cacheConfiguration: Bool = false, autoPlay: Bool = false, islooping: Bool = false) {
        self.videoUrl = videoUrl
        self.thumbnailUrl = thumbnailUrl
        self.cacheConfiguration = cacheConfiguration
        self.autoPlay = autoPlay
        self.islooping = islooping
    }
}

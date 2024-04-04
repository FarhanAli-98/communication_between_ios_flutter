import Flutter
import UIKit
import AVFoundation

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    var playerArgs: PlayerArgs
    
    init(messenger: FlutterBinaryMessenger, playerArgs: PlayerArgs) {
        self.messenger = messenger
        self.playerArgs = playerArgs
        super.init()
    }
    
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger, playerArgs: self.playerArgs)
    }
    
    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    private let playerService = VideoPlayerService()
    private var playerArgs: PlayerArgs
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?, playerArgs: PlayerArgs
    ) {
        _view = UIView(frame: UIScreen.main.bounds)
        self.playerArgs = playerArgs
        super.init()
        // iOS views can be created here
        self.playerService.observers = self
        createNativeView(view: _view)
        NotificationCenter.default.addObserver(self, selector: #selector(performPlayerActions(_:)), name: Notification.Name(rawValue: "perform_actions"), object: nil)
    }
    
    func view() -> UIView {
        return _view
    }
    
    func createNativeView(view _view: UIView) {
        guard let url = URL(string: self.playerArgs.videoUrl) else {return}
        let player = self.playerService.configurePlayerView(frame: _view.bounds, from: url, thumbnailImageUrl: self.playerArgs.thumbnailUrl, loopingEnabled: self.playerArgs.islooping, cacheConfiguration: self.playerArgs.cacheConfiguration, autoplay: self.playerArgs.autoPlay)
        _view.addSubview(player)
    }
    @objc func performPlayerActions(_ notification: Notification) {
        if let userInfo = notification.userInfo as? [String: Any] {
            if let action = userInfo["action"] as? String {
                switch action {
                case "play":
                    self.playerService.play()
                case "pause":
                    self.playerService.pause()
                case "restart":
                    self.playerService.restart()
                default:
                    break
                }
            }
        }
    }
    deinit {
        playerService.removeObservers()
        NotificationCenter.default.removeObserver(self)
    }
}
extension FLNativeView: VideoPlayerServiceObserver {
    func videoPlayerServiceInitialized() {
        print("Initialized")
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.invokeData(name: "initialized", args: [:])
        }
    }
    
    func videoPlayerServicePlay() {
        print("Playing")
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.invokeData(name: "playing", args: [:])
        }
    }
    
    func videoPlayerServicePause() {
        print("Paused")
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.invokeData(name: "paused", args: [:])
        }
    }
    
    func videoPlayerServiceProgress(time: CMTime) {
    }
    
    func videoPlayerServiceFinished() {
        print("Finished")
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.invokeData(name: "finished", args: [:])
        }
    }
    
    func videoPlayerServiceException() {
    }
}

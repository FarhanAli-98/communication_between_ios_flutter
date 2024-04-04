import Flutter
import UIKit
import AVFoundation

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    private var url: String
    
    init(messenger: FlutterBinaryMessenger, url: String) {
        self.messenger = messenger
        self.url = url
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
            binaryMessenger: messenger, url: url)
    }
    
    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    private let playerService = VideoPlayerService()
    private var url: String
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?, url: String
    ) {
        _view = UIView(frame: UIScreen.main.bounds)
        self.url = url
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }
    
    func view() -> UIView {
        return _view
    }
    
    func createNativeView(view _view: UIView) {
        let url = URL(string: self.url)!
        let player = self.playerService.configurePlayerView(frame: _view.bounds, from: url)
        _view.addSubview(player)
    }
    deinit {
        playerService.removeObservers()
    }
}

//
//  ViewController.swift
//  FlutterIntegration
//
//  Created by Hungerstation on 23/11/2022.
//

import UIKit
import Flutter
import Kingfisher
import FlutterPluginRegistrant

class ViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var messageToNativeCodeChannel: FlutterMethodChannel!

    @IBAction func openFlutterScreen(_ sender: Any) {
        messageToNativeCodeChannel = FlutterMethodChannel(
            name: "my_flutter_app.messageToNativeCodeChannel",
            binaryMessenger: appDelegate.flutterEngine.binaryMessenger
        )
        let user = User(name: "rahim", email: "rahim@gmail.com")
        let data = try! JSONEncoder().encode(user)
        let userJsonStr = String(data: data, encoding: .utf8)
        messageToNativeCodeChannel.invokeMethod("receieveMessage", arguments: userJsonStr)
        
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
            let flutterViewController =
                FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
            present(flutterViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


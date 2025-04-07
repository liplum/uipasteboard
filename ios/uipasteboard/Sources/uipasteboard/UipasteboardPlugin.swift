import Flutter
import UIKit

private let channel = "uipasteboard"

public class UiPasteboardPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: channel, binaryMessenger: registrar.messenger())
    let instance = UiPasteboardPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getURLs":
      getURLs(call, result)
      return
    case "getURL":
      getURL(call, result)
      return
    case "hasURLs":
      hasURLs(call, result)
      return
    case "getChangeCount":
      getChangeCount(call, result)
      return
    case "getNumberOfItems":
      getNumberOfItems(call, result)
      return
    case "getImage":
      getImage(call, result)
      return
    case "getImages": 
      getImages(call, result)
      return
    case "hasImages":
      hasImages(call, result)
      return
    case "getString":
      getString(call, result)
      return
    case "getStrings":
      getStrings(call, result)
      return
    case "hasStrings":
      hasStrings(call, result)
      return
    case "hasColors":
      hasColors(call, result)
      return
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func getChangeCount(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    result(UIPasteboard.general.changeCount)
  }

  private func getNumberOfItems(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    result(UIPasteboard.general.numberOfItems)
  }

  private func getURL(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if let url = UIPasteboard.general.url {
      result(url.absoluteString)
    } else {
      result(nil)
    }
  }

  private func getURLs(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if let urls = UIPasteboard.general.urls {
      result(urls.map { $0.absoluteString })
    } else {
      result(nil)
    }
  }

  private func hasURLs(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if UIPasteboard.general.hasURLs {
      result(true)
    } else {
      result(false)
    }
  }

  private func hasImages(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if UIPasteboard.general.hasImages {
      result(true)
    } else {
      result(false)
    }
  }

  private func getImage(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if let image = UIPasteboard.general.image, let imageData = image.pngData() {
      result(FlutterStandardTypedData(bytes: imageData))
    } else {
      result(nil)
    }
  }

  private func getImages(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if let images = UIPasteboard.general.images {
      var imageDataList: [FlutterStandardTypedData] = []
      for image in images {
        if let imageData = image.pngData() {
          imageDataList.append(FlutterStandardTypedData(bytes: imageData))
        }
      }
      result(imageDataList)
    } else {
      result(nil)
    }
  }

  private func hasStrings(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if UIPasteboard.general.hasStrings {
      result(true)
    } else {
      result(false)
    }
  }

  private func getString(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if let string = UIPasteboard.general.string {
      result(string)
    } else {
      result(nil)
    }
  }

  private func getStrings(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if let strings = UIPasteboard.general.strings {
      result(strings)
    } else {
      result(nil)
    }
  }

  private func hasColors(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if UIPasteboard.general.hasColors {
      result(true)
    } else {
      result(false)
    }
  }
}

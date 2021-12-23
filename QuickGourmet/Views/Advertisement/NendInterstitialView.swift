//
//  NendInterstitialView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/11.
//

import NendAd
import SwiftUI

class NendInterstitialView: NSObject, NADInterstitialLoadingDelegate, NADInterstitialClickDelegate {
    override init() {
        super.init()
        NADInterstitial.sharedInstance().loadingDelegate = self
        NADInterstitial.sharedInstance().clickDelegate = self
    }

    deinit {
        NADInterstitial.sharedInstance().delegate = nil
    }

    // 静止広告の表示
    func showInterstitiaStillessAD() {
        var showResult: NADInterstitialShowResult
        let rootVC = UIApplication.shared.windows.first?.rootViewController
        showResult = NADInterstitial.sharedInstance().showAd(from: rootVC, spotID: NEND_INTERSTITIAL_STILLNESS_SPOTID)

        switch showResult {
        case .AD_SHOW_SUCCESS:
            print("AD_SHOW_SUCCESS")
        case .AD_LOAD_INCOMPLETE:
            print("AD_LOAD_INCOMPLETE")
        case .AD_REQUEST_INCOMPLETE:
            print("FAILED_AD_REQUEST")
        case .AD_DOWNLOAD_INCOMPLETE:
            print("FAILED_AD_DOWNLOAD")
        case .AD_FREQUENCY_NOT_REACHABLE:
            print("AD_FREQUENCY_NOT_REACHABLE")
        case .AD_SHOW_ALREADY:
            print("AD_SHOW_ALREADY")
        case .AD_CANNOT_DISPLAY:
            print("AD_CANNOT_DISPLAY")
        @unknown default:
            break
        }
    }

    func didFinishLoadInterstitialAd(withStatus status: NADInterstitialStatusCode) {}

    func didClick(with type: NADInterstitialClickType) {
        switch type {
        case .DOWNLOAD:
            print("DOWNLOAD")
        case .CLOSE:
            print("CLOSE")
        case .INFORMATION:
            print("INFORMATION")
        @unknown default:
            break
        }
    }
}
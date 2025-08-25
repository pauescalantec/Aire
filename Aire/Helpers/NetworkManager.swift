//
//  NetworkManager.swift
//  Aire
//
//  Created by Natalia García on 8/1/18.
//  Copyright © 2018 QuimeraVerde. All rights reserved.
//  https://blog.pusher.com/handling-internet-connection-reachability-swift/

import Foundation
import Reachability

final class NetworkManager: NSObject {

    static let shared = NetworkManager()

     var reachability: Reachability?

    override init() {
        super.init()

        do {
            // Reachability() can throw in newer versions
            reachability = try Reachability()
        } catch {
            print("Unable to create Reachability:", error)
            reachability = nil
        }

        // Observe changes
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )

        // Start notifier (throws)
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier:", error)
        }
    }

    deinit {
        // Clean up
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self)
    }

    @objc func networkStatusChanged(_ notification: Notification) {
        // Handle global changes if needed
    }

    static func stopNotifier() {
        // ✅ call stopNotifier (no try needed)
        NetworkManager.shared.reachability?.stopNotifier()
    }

    // Network is reachable
    static func isReachable(completed: @escaping (NetworkManager) -> Void) {
        guard let r = NetworkManager.shared.reachability else { return }
        // Newer API: .unavailable; older: .none
        if r.connection != .unavailable {
            completed(NetworkManager.shared)
        }
    }

    // Network is unreachable
    static func isUnreachable(completed: @escaping (NetworkManager) -> Void) {
        guard let r = NetworkManager.shared.reachability else { return }
        if r.connection == .unavailable {
            completed(NetworkManager.shared)
        }
    }
}

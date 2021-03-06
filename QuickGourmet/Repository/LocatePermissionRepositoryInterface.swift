//
//  LocatePermissionRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import Foundation

protocol LocatePermissionRepositoryInterface {
    func getStatus() -> LocationStatusType
    func callRequestWhenInUse(complication: @escaping (LocationStatusType) -> Void)
    func callStartUpdateLocation()
    var delegate: LocatePermissionRepositoryDelegate? { get set }
}

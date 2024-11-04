//
//  JXBaseBanner.swift
//  JXBanner_Example
//
//  Created by Code_JX on 2019/5/11.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public protocol JXBannerType: UIView {

    /// Data source protocol for JXBannerType
    var dataSource: JXBannerDataSource? { get set }
                                                                                           
    /// Delegate protocol for JXBannerType
    var delegate: JXBannerDelegate? { get set }
    
    /// Distinguish the banner
    var indentify: String? { get set }
    /// The refresh UI
    func reloadView()
    
}

/// A structure that registers cells so that
/// we can distinguish and retrieve reused cells from the cache pool

public struct JXBannerCellRegister {
    
    var type: UICollectionViewCell.Type?
    var reuseIdentifier: String
    var haveCell: Bool
    var nib: UINib?
    
    public init(type: UICollectionViewCell.Type?,
                reuseIdentifier: String,
                haveCell: Bool = false,
                nib: UINib? = nil) {
        self.type = type
        self.haveCell = haveCell
        self.reuseIdentifier = reuseIdentifier
        self.nib = nib
    }
}

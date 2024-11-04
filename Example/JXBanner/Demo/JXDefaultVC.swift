//
//  JXDefaultVC.swift
//  JXBanner_Example
//
//  Created by Coder_TanJX on 2019/7/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import JXBanner

class JXDefaultVC: UIViewController {
    
    var pageCount = 5

    @IBOutlet weak var banner: JXBanner!
    @IBOutlet weak var verticalBanner: JXBanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        banner.placeholderImgView.image = UIImage(named: "banner_placeholder")
        banner.indentify = "banner"
        banner.delegate = self
        banner.dataSource = self
        verticalBanner.placeholderImgView.image = UIImage(named: "banner_placeholder")
        verticalBanner.delegate = self
        verticalBanner.dataSource = self
        
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    deinit {
        print("\(#function) ----------> \(#file.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? #file)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        banner.reloadView()
    }
}

//MARK:- JXBannerDataSource
extension JXDefaultVC: JXBannerDataSource {
    
    func jxBanner(_ banner: JXBannerType)
        -> (JXBannerCellRegister) {
            return JXBannerCellRegister(type: JXBannerCell.self,
                                        reuseIdentifier: "JXDefaultVCCell")
    }
    
    func jxBanner(numberOfItems banner: JXBannerType)
        -> Int { return pageCount }
    
    func jxBanner(_ banner: JXBannerType, cellForItemAt index: Int, bannerCollectionView: UICollectionView, cellIndexPath: IndexPath, cell: UICollectionViewCell) -> UICollectionViewCell {
            let tempCell = cell as! JXBannerCell
            tempCell.layer.cornerRadius = 8
            tempCell.layer.masksToBounds = true
            tempCell.imageView.image = UIImage(named: "\(index).jpg")
            tempCell.msgLabel.text = String(index) + "---来喽来喽,他真的来喽~"
            return tempCell
    }
    
    func jxBanner(_ banner: JXBannerType,
                  layoutParams: JXBannerLayoutParams)
        -> JXBannerLayoutParams {
        
        
        if banner.indentify == "banner" {
            return layoutParams
                .itemSize(CGSize(width: 300, height: 150))
                .itemSpacing(20)
        } else {
            return layoutParams
                .itemSize(CGSize(width: 300, height: 150))
                .itemSpacing(20)
                .scrollDirection(.vertical)
        }
    }
    
}

//MARK:- JXBannerDelegate
extension JXDefaultVC: JXBannerDelegate {
    
    public func jxBanner(_ banner: JXBannerType,
                         didSelectItemAt index: Int) {
        print(index)
    }
    
    func jxBanner(_ banner: JXBannerType, center index: Int) {
        print(index)
    }
    
    
    
}

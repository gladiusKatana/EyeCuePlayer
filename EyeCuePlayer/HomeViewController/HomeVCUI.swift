// eyeCuePlayer ･ HomeVCUI.swift
import UIKit

extension HomeVC {
    
    func scrollToMenuIndex(_ menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition(), animated: true)  // * * *
        setTitleForIndex(menuIndex)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 2    // .x/1.333
        //print("scroll")
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition())
        setTitleForIndex(Int(index))
    }
    
    func showSettingsPanel() {settingsPanel.showSettingsView()}
    
    @objc func showAltSettingsPanel() {settingsControllerB.showSettingsView()}
    
    @objc func selectImageTurnedOffMessage() {print("select image turned off for now")}
    
}


// eyeCuePlayer ･ HomeVC.swift
import UIKit

class HomeVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let cellIdZero = "cellIdZero";  let cellIdOne = "cellId1";  let cellIdTwo = "cellId2";  let cellIdThree = "cellId3"
    let titles = ["eyeCuePlayer", "eyeCuePlayer", "Umath", "compSci"]
    
    lazy var videoController: VideoVC = {
        let videoController = VideoVC()
        return videoController
    }()
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeVC = self
        return mb
    }()
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func setTitleForIndex(_ menuIndex: Int) {
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "\(titles[menuIndex])"
            titleLabel.isUserInteractionEnabled = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heightAdjust = self.navigationController?.navigationBar.frame.height
        return CGSize(width: view.frame.width/2, height: view.frame.height - heightAdjust!) // was 50 originally
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier: String
        
        if indexPath.item == 1      {identifier = cellIdOne}
        else if indexPath.item == 2 {identifier = cellIdTwo}
        else if indexPath.item == 3 {identifier = cellIdThree}
        else                        {identifier = cellIdZero}
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}


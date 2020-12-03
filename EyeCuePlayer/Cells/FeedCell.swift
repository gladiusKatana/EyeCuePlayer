// eyeCuePlayer ･ FeedCell.swift
import UIKit

var cellTap = UITapGestureRecognizer();  var buttonTypeName = "slowMo or slider"

class CalibrateButton: UIButton {
    var cellIndex: Int = 0
}

//MARK: FEEDCELL
class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = true
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var videos: [Video]?                    //; print("\(videos.count) videos")
    let cellId = "cellId"
    
    override func setupViews() {            //print("setting up views")
        super.setupViews()
        getFeed() ///; print("there are \(String(describing: videos?.count)) videos in this feed") //prints "there are nil videos in this feed"
        addSubview(collectionView)
        addConstraintsWithFormat("H:|-25-[v0]-25-|", views: collectionView) ///nonzero -#- doesn't seem to make a difference
        addConstraintsWithFormat("V:|-50-[v0]-|", views: collectionView)    //200+58+59+58 = 375
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func getFeed() {                        /// was called fetchVideos()  (ie, use that again for overall feed of all videos;  "filtered api calls")
        ApiService.sharedInstance.fetchFeedZero { (videos: [Video]) in  /// better description might be "closure api calls?"
            self.videos = videos            //; print("cell zero has \(self.videos!.count) videos")
            //self.videos = globalVideos
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        ///print("there are \(String(describing: videos?.count)) videos in this feed")      //prints with "nil" too I think
        return videos?.count ?? 0 //return 1//videos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        ///let height = 100//(frame.width) * 9 / 16; return CGSize(width: frame.width, height: height /*+ 16*/)
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50    
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos?[indexPath.item]    //; print("cell's video is \(cell.video?.video_link)")
        
        //        let editButton = CalibrateButton(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        //        let image = UIImage(named: "frameSliderButton")?.withRenderingMode(.alwaysTemplate)
        //        editButton.setImage(image, for: UIControl.State())
        //        editButton.tintColor = .lightGray
        //
        //        editButton.cellIndex = indexPath.item
        //        editButton.addTarget(self, action: #selector(handleSlowMoViewTap), for: UIControl.Event.touchUpInside)
        //        cell.addSubview(editButton)
        //
        //        let sliderButton = CalibrateButton(frame: CGRect(x: 5, y: 40, width: 40, height: 40))
        //        let sliderButtonImage = UIImage(named: "settingsButton")?.withRenderingMode(.alwaysTemplate)
        //        sliderButton.setImage(sliderButtonImage, for: UIControl.State())
        //        sliderButton.tintColor = .lightGray
        //
        //        sliderButton.cellIndex = indexPath.item
        //        sliderButton.addTarget(self, action: #selector(handleSliderViewTap), for: UIControl.Event.touchUpInside)
        //        cell.addSubview(sliderButton)
        
        return cell
    }
}


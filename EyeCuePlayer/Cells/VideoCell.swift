// eyeCuePlayer ･ VideoCell.swift
import UIKit

class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            setupThumbnailImage()
            setupProfileImage()
            
            if let title = video?.title, let channelName = video?.channel?.name, let numberOfViews = video?.number_of_views {
                let numberFormatter = NumberFormatter();  numberFormatter.numberStyle = .decimal
                let numberOfViewsString = numberFormatter.string(from: numberOfViews)!
                
                let titleText = "\(title)     ▶︎\(numberOfViewsString)     \(channelName)     "
                titleLabel.text = titleText
                feedTitleLabel.text = channelName
                
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)  //seems like height can be anything
                
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: titleText).boundingRect(with: size, options: options, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.systemFont(ofSize: 6)]), context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 25//44
                } else {
                    titleLabelHeightConstraint?.constant = 15//20
                }
            }
        }
    }
    
    let thumbnailImageView: CachedImgView = {
        let imageView = CachedImgView()
        imageView.backgroundColor = .white  //covered anyway
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    let userProfileImageView: CachedImgView = {
        let imageView = CachedImgView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        label.textColor = .darkGray  //UIColor.rgb(0, green: 0, blue: 0, alpha: 0.6)
        label.numberOfLines = 1 //was 2
        label.translatesAutoresizingMaskIntoConstraints = false;  label.isUserInteractionEnabled = false
        return label
    }()
    
    let feedTitleLabel: UILabel = {
        let feedLabel = UILabel()
        feedLabel.font = UIFont.systemFont(ofSize: 12)
        feedLabel.backgroundColor = .clear
        feedLabel.textColor = .clear
        feedLabel.textAlignment = .center
        feedLabel.numberOfLines = 1
        feedLabel.translatesAutoresizingMaskIntoConstraints = false;  feedLabel.isUserInteractionEnabled = false
        return feedLabel
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        videoCellViewSetup()
    }
}

// Helper functions inserted by Swift 4.2 migrator:
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}


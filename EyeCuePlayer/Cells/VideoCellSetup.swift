// eyeCuePlayer ･ VideoCellSetup.swift
import UIKit

extension VideoCell {
    
    func videoCellViewSetup() {
        backgroundColor = UIColor.rgb(150, green: 180, blue: 220, alpha: 0.3)
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(userProfileImageView)
        addSubview(feedTitleLabel)
        
        addConstraintsWithFormat("V:|-0-[v0]-(-20)-[v1(20)]-0-|", views: thumbnailImageView, userProfileImageView)
        addConstraintsWithFormat("H:|-0-[v0]-(-30)-[v1(20)]-|", views: thumbnailImageView, userProfileImageView)
        addConstraintsWithFormat("H:|-0-[v0]-1-|", views: feedTitleLabel)
        addConstraintsWithFormat("H:|-0-[v0]-0-|", views: titleLabel)
        
        addConstraint(NSLayoutConstraint(item: feedTitleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: -36))
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 14)
        addConstraint(titleLabelHeightConstraint!) ///(toItem: can be self or really anything)
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageUrlString = video?.thumbnail_image_name {
            thumbnailImageView.loadImageUsingUrlString(thumbnailImageUrlString)
            
            let url = URL(string: thumbnailImageUrlString)
            if !tempSavedBool {
                createDocumentFolderUrl(downloadUrl: url!, formatSelectorId: "thumbnail")
            }
        } //else {print("could not get video thumbnail")}
    }
    
    func setupProfileImage() {
        if let profileImageUrl = video?.channel?.profile_image_name {
            userProfileImageView.loadImageUsingUrlString(profileImageUrl)
            //userProfileImageView.contentMode = .scaleAspectFill
        }
    }
}


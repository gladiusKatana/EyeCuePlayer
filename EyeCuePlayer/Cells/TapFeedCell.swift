// eyeCuePlayer ･ TapFeedCell.swift
import UIKit

extension FeedCell {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) { ///print("(tapped) videos: \(String(describing: videos?[indexPath.item]))")
        
        if let tappedVideoLink = videos?[indexPath.item].video_link {
            selectedVideoLink = tappedVideoLink
        } else {print("did not call videoLauncher due to  video_link")}
        
        if let tappedVideoDuration = videos?[indexPath.item].duration {
            levelLength = Double(truncating: tappedVideoDuration)
        } else {print("did not call videoLauncher due to  duration")}
        
        if let tappedThumbnailLink = videos?[indexPath.item].thumbnail_image_name {
            selectedThumbnailLink = tappedThumbnailLink
        } else {print("did not call videoLauncher due to  thumbnail_image_name")}
        
        if let selectedTitle = videos?[indexPath.item].title { ///print("selected video with title  \(selectedTitle), in feed \(indexPath.row)")
            playerTempTitle = selectedTitle
        } else {print("did not call videoLauncher due to  title")}
        
        // if !justCalibrated {                                     //default pause times
        if playerTempTitle != slowMoTempTitle {
            if let tappedTimes = videos?[indexPath.item].times {
                times = tappedTimes                                 ///; print("pause times: \(times) \n(printed from feed cell")
                
                if tappedTimes.count > 2 {
                    calibrateMode = false
                } else {calibrateMode = true}                       //; print("calibrateMode = \(calibrateMode)")
            } else {print("did not call videoLauncher due to  times[]")}
        }
        //}
        //let levelLengthPlusABit = 1.05 * levelLength              //; times.append(levelLengthPlusABit)
        
        if let tappedPages = videos?[indexPath.item].pages_to_edit {
            pages = tappedPages
        } else {print("did not call videoLauncher due to  pages_to_edit[]")}
        
        if let tappedDescriptions = videos?[indexPath.item].descriptions { ///print("tappedDescriptions = \(tappedDescriptions)")
            descriptions = tappedDescriptions                       //; print("just set \(descriptions) from FeedCell")
        } else {print("did not call videoLauncher due to  description_t[]")}
        
        videoVC.showVideoPlayer()
        //screenshotController.showScreenshot()                     //; tempSavedBool = false
    }
}


// eyeCuePlayer ･ SaveDocument.swift
import UIKit;  import AVKit

extension VideoCell {
    
    func createDocumentFolderUrl(downloadUrl: URL, formatSelectorId: String) {  ///print("format selector id = \(formatSelectorId)")
        let documentsUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let destination = documentsUrl.appendingPathComponent(downloadUrl.lastPathComponent)    // destination file url
        ///print("appended path component: \(downloadUrl.lastPathComponent)")                           ///; print("destination = \(destination)")
        destinationString = String(describing: destination)                     ///;  print("\ndestinationString = \(destinationString)")
        
        if FileManager().fileExists(atPath: (destination.path)) {   // check if it exists before downloading it
            let data = try? Data(contentsOf: destination)
            
            if formatSelectorId == "thumbnail" {
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    thumbnailImageView.image = image
                }
            } else if formatSelectorId == "video" {
                let earl = URL(fileURLWithPath: (destination.path))
                avPlayer = AVPlayer(url: earl)
                viewLoaded = true
                ///print("▶︎ file already exists at path (\(formatSelectorId))");  tempSavedBool = true
                ///print("// destinationString:  \(destinationString)")
            } else {print("file selector id error")}
        } else {                                                    ///print("☐  file doesn't exist at path yet (\(formatSelectorId)) ")
            URLSession.shared.downloadTask(with: downloadUrl, completionHandler: { (location, response, error) in
                ///just download the data from your url; then you need to save it to your destination url
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    //let mimeType = response?.mimeType, mimeType.hasPrefix("audio"),
                    let location = location, error == nil
                else {
                    print("uh oh")
                    viewLoaded = false
                    return }
                do {
                    try FileManager.default.moveItem(at: location, to: destination)
                    if formatSelectorId == "video" {
                        print("\n✔ file saved:  \(String(describing: destination))")
                    }//viewLoaded = true}   //!
                } catch {
                    //if formatSelectorId == "video" {print("\nX file not saved")}
                    print(error)
                }
            }).resume()
        }
    }
}


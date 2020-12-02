// eyeCuePlayer ･ APIService.swift
import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3.ca-central-1.amazonaws.com/eye.cue.player"
    
    func fetchFeedZero(_ completion: @escaping ([Video]) -> ()) {                           ///need these wrapper functions fetchFeed(N) bc. called as a closure
        fetchFeedForUrlString(urlString: "\(baseUrl)/maths.json", completion: completion)
    }
    
    func fetchFeedOne(_ completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/umath.json", completion: completion)
    }
    
    func fetchFeedTwo(_ completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/physj.json", completion: completion)
    }
    
    func fetchFeedThree(_ completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/mores.json", completion: completion)
    }
}

func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {  ///can be -> Void or -> ()
    
    guard let url = URL(string: urlString) else {print("error binding url"); return}
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        let data = data
        
        if error != nil {
            print(error as Any)
            return
        }
        do {
            if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                
                DispatchQueue.main.async() {
                    
                    completion (
                        jsonDictionaries.map({
                            let video = Video(dictionary: $0)
                            
                            video.title = $0["title"] as? String
                            video.video_link = $0["video_link"] as? String
                            video.thumbnail_image_name = $0["thumbnail_image_name"] as? String
                            
                            video.number_of_views = $0["number_of_views"] as? NSNumber
                            video.duration = $0["duration"] as? NSNumber
                            
                            video.descriptions = $0["descriptions"] as? [String]
                            video.times = $0["times"] as? [Double]
                            video.pages_to_edit = $0["pages_to_edit"] as? [Int]
                            
                            guard let channelDictionary = $0["channel"] as? [String: AnyObject] else {
                                print("could not downcast channel dictionary"); return video
                            }
                            
                            let channel = Channel()
                            channel.name = channelDictionary["name"] as? String
                            channel.profile_image_name = channelDictionary["profile_image_name"] as? String
                            
                            video.channel = channel                                     //; print("json map video: \(video.title ?? "")")
                            
                            return video
                        }
                        )
                    )
                }
                
            } else {print("error unwrapping data")}
        } catch let jsonError {
            print(jsonError)
        }
        
    }.resume()
}


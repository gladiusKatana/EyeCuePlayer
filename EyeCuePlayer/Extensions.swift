// eyeCuePlayer ･ Extensions.swift
import UIKit

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension Array {
    func removeDuplicatesFromList() -> [Double] {
        
        var removalCompensator = 0
        
        for removalIndex in timesIndicesToRemove {
            //print("------------------------removing duplicate: times[\(removalIndex)] = \(times[removalIndex])")
            
            times.remove(at: removalIndex - removalCompensator)
            removalCompensator = removalCompensator + 1
        }
        return times
    }
}


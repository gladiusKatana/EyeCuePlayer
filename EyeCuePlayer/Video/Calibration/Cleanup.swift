// eyeCuePlayer ･ Cleanup.swift
import UIKit

extension VideoPlayerView {
    
    func removeDuplicates() {
        print("\n{length = \(times.count)}")
        print(print("\ntimes = \(times)"))
        print("\n------------------------------------------------------------------removing duplicates\n")
        
        for index in (1 ... times.count - 1) {
            print("index = \(index); previous = \(index - 1)")
            
            if times[index] < (times[index - 1] + 0.1) {        // Keynote whitebar duration = 0.1
                print("-------------------------- duplicates are times[\(index - 1)] = \(times[index - 1])")
                print("                                   ...& times[\(index)] = \(times[index])")
                
                //times.remove(at: index)
                timesIndicesToRemove.append(index)
            }
        }
        print("\n-----------------------------------------------------------------------removing duplicates at: \(timesIndicesToRemove)\n")
        times = times.removeDuplicatesFromList();    print("ok, now times = \(times)")
    }
    
}


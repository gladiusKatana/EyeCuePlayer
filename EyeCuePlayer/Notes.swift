// eyeCuePlayer ･ Notes.swift   //  Created by Garth Snyder on 2017-06-27.  //  Copyright © 2017 Garth Snyder. All rights reserved.


/*
 ✏️ to rewrite*                                                              * since re-pot / Swift 5 conversion.  (above: original version date)

        (trivial) reorg/refactor/rename global variables & functions based on their... function (see 'Globals' group)
 
        (UI) Play button: enable as a Setting
 
 
        SettingsView: refactor / remove duplicate instances
 
 
        Video calibration via pixel scanner (make less verbose)
 
 
        Slide to Seek (should be easy to add back)
        
        Slide to Seek: No timing 'bubble' when flipping to/from tap/swipe playback
 
        Slide to Seek: Modulation: perfect resetting of slider position/constraints when hit max range
 
        Slide to seek: Latency: minimize latency/hiccups in Remote Control mode
 
 
 
        Remote control, via MultipeerConnectivity ("MPC") (had used CoreBluetooth-- worked ok but too verbose / hassle to maintain over time)

        2-way Remote w/playback control only for Lecturer device; all controls for Student device (*2-way Remote is defaulted, using MPC)
        
 
        Video downloading: notifications & warnings: if not within wifi network; optional near-ISP's-limit; download complete notification
 
        
        Video Cells: Multigestures replace button subviews
 
 
 ⚔️ add:
 
 Save settngs via UserDefaults
 
 Full Builder: programmatic animations rather than laborious PowerPoint Morph / Keynote MagicMove (...will help avoid needing pixel-scan-convert)

 Upload content via app
 
 Broadcasting/screensharing for livestreams
 
 
 
 
 
 
 
 
 
 
 */


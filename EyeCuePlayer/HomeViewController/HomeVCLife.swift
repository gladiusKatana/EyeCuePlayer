// eyeCuePlayer ･ HomeVCLife.swift
import UIKit //Life means lifecycle

extension HomeVC {
    
    override func viewDidLoad() {   //print("home controller loaded")
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: feedBackgroundImage!)
        //navigationController?.hidesBarsOnSwipe = true
        
        displayDate()
        viewFrameHeight = Double(view.frame.height)                             ///;  print("view frame height = \(viewFrameHeight)")
        aspectFrameHeight = Double(view.frame.width) * 9/16                     ///;  print("aspectFrameHeight = \(aspectFrameHeight)")
        viewFrameWidth = Double(view.frame.width)                               ///;  print("viewFrameWidth = \(viewFrameWidth)")
        ///print(UIApplication.shared.statusBarFrame.height)    ///; print(self.navigationController?.navigationBar.intrinsicContentSize.height as Any)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 20))    ///height setting doesn't seem to matter
        titleLabel.text = "eyeCuePlayer"
        titleLabel.backgroundColor = UIColor.rgb(150, green: 150, blue: 180, alpha: 0.0)
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        navigationItem.titleView = titleLabel
        titleLabel.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        }
        setupCollectionView()
        setupNavBarButtons()
        setupMenuBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let viewHeightAdded = CGFloat(adjustHeight) //whatever height you want
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + viewHeightAdded)
    }
}


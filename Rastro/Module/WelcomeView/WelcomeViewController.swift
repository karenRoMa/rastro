//
//  WelcomeViewController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import FlexiblePageControl
import Gemini

class WelcomeViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var tutorialCollectionView: GeminiCollectionView!
    @IBOutlet weak var pageControl: FlexiblePageControl!
    @IBOutlet weak var beginButton: UIButton!
    
    weak var coordinator: MainCoordinator?
    
    // MARK: Class Variables
    var contents: [[String: String]] = [["title" : TutorialStrings.firstTitle.localized, "content" : TutorialStrings.firstContent.localized, "image":TutorialStrings.firstContent.rawValue.camelToSnakeCase()],
                                        ["title" : TutorialStrings.secondTitle.localized,  "content" : TutorialStrings.secondContent.localized, "image": TutorialStrings.secondContent.rawValue.camelToSnakeCase()],
                                        ["title" : TutorialStrings.thirdTitle.localized, "content" : TutorialStrings.thirdContent.localized, "image": TutorialStrings.thirdContent.rawValue.camelToSnakeCase()]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configurePageControl()
        configureCollectionView()
    }
    
    // MARK: View Configuration
    
    func configureView() {
        title = ""
        tutorialCollectionView.gemini
            .scaleAnimation()
            .scale(0.75)
        // Login Button
        beginButton.applyEnabledButtonStyle()
    }
    
    func configureCollectionView() {
        tutorialCollectionView.dataSource = self
        tutorialCollectionView.delegate = self
        tutorialCollectionView.register(UINib(nibName: TutorialCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: TutorialCollectionViewCell.reuseIdentifier)
    }
    
    func configurePageControl() {
        pageControl.numberOfPages = contents.count
        pageControl.pageIndicatorTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.32)
        pageControl.currentPageIndicatorTintColor = UIColor.black
    }
    
    // MARK: - IBActions -
    
    @IBAction func begin(_ sender: Any) {
        coordinator?.goToLogin()
    }
}

// MARK: - Collection View Delegate & Data Source -

extension WelcomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCollectionViewCell.reuseIdentifier, for: indexPath) as? TutorialCollectionViewCell else {return UICollectionViewCell()}
        cell.configureCell(withInfo: contents[indexPath.row])
        tutorialCollectionView.animateCell(cell)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
        tutorialCollectionView.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let tutorialCell = cell as? TutorialCollectionViewCell else {return}
        if let cell = cell as? GeminiCell {
            self.tutorialCollectionView.animateCell(cell)
        }
    }
    
}


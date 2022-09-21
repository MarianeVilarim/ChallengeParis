//
//  DemoViewController.swift
//  dor
//
//  Created by MLaura on 15/09/22.
//


import UIKit

class DemoViewController: UIPageViewController{
    
    var pages = [UIViewController]()
    
    let skipButton = UIButton()
    let nextButton = UIButton()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    // animações
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonBottomAnchor: NSLayoutConstraint?
    var nextButtonBottomAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    // cabou o override aqui embaixo
}

extension DemoViewController{
    
    func setup() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped( _:)), for: .valueChanged)
        
     
        
        let onboardingContent = [OnboardingInfo(titulo: "Encontre\nExperiências", texto: "Descubra como celebrar de forma inovadora no Recife", botaoVisivel: false, backgroundImage: UIImage(named: "Bg1")!, mainImage: UIImage(named: "Onb1")!), OnboardingInfo (titulo:"Anime seu\naniversário", texto: "Crie momentos divertidos\npara entrosar a galera", botaoVisivel: false, backgroundImage: UIImage(named: "Bg2")!, mainImage: UIImage(named: "Onb2")!), OnboardingInfo(titulo: "Anime seu\naniversário", texto: "Crie momentos divertidos para entrosar a galera", botaoVisivel: false, backgroundImage: UIImage(named: "Bg3")!, mainImage: UIImage(named: "Onb3")!), OnboardingInfo(titulo: "Vamos\nCelebrar?", texto: "Experimente novas formas\nde comemorar", botaoVisivel: true, backgroundImage: UIImage(named: "Bg4")!, mainImage: UIImage(named: "Onb4")!)]


        
        let page1 = OnboardingPagingViewController(imageName: onboardingContent[0].mainImage, titleText: onboardingContent[0].titulo, subtitleText: onboardingContent[0].texto, backgroundImage: onboardingContent[0].backgroundImage
        )
        let page2 = OnboardingPagingViewController(imageName: onboardingContent[1].mainImage, titleText: onboardingContent[1].titulo, subtitleText: onboardingContent[1].texto, backgroundImage: onboardingContent[1].backgroundImage
        )
        let page3 = OnboardingPagingViewController(imageName: onboardingContent[2].mainImage, titleText: onboardingContent[2].titulo, subtitleText: onboardingContent[2].texto, backgroundImage: onboardingContent[2].backgroundImage
        )
        let page4 = OnboardingPagingViewController(imageName: onboardingContent[3].mainImage, titleText: onboardingContent[3].titulo, subtitleText: onboardingContent[3].texto, backgroundImage: onboardingContent[3].backgroundImage 
        )
        
     

        
        pages.append(page1)
        page1.startButton.isHidden = true
        pages.append(page2)
        page2.startButton.isHidden = true
        pages.append(page3)
        page3.startButton.isHidden = true
        pages.append(page4)
        page4.startButton.isHidden = false
       
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
 
    }
    
    func style(){
        
        self.view.backgroundColor = UIColor(named: "onboardingPurple")
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor(named: "onboardingPurple")
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage

    
        
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitleColor(.onboardingPurple, for: .normal)
        skipButton.setTitle("Voltar", for: .normal)
        skipButton.addTarget(self, action: #selector(backTapped(_:)), for: .primaryActionTriggered)
        
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitleColor(.onboardingPurple, for: .normal)
        nextButton.setTitle("Seguir", for: .normal)
        nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
    }
    func layout() {
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        

        
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            skipButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),

            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 4),
        ])
        
        // animacoes
        pageControlBottomAnchor = view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 2)
        skipButtonBottomAnchor = skipButton.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 2)
        nextButtonBottomAnchor = nextButton.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 2)
        
        pageControlBottomAnchor?.isActive = true
        skipButtonBottomAnchor?.isActive = true
        nextButtonBottomAnchor?.isActive = true
    }
}
// MARK: - DataSource

extension DemoViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last               // wrap last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return pages.first              // wrap first
        }
    }
}

// MARK: - Delegates

extension DemoViewController: UIPageViewControllerDelegate {
    
    // How we keep our pageControl in sync with viewControllers
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
        
    
    }
    
    private func animateControlsIfNeeded() {
      // esse hifen era o last page
        _ = pageControl.currentPage == pages.count - 1
        

        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.transitionFlipFromRight], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    

}

// MARK: - Actions

extension DemoViewController {

    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        animateControlsIfNeeded()
    }

    @objc func nextTapped(_ sender: UIButton) {
        pageControl.currentPage += 1
        goToNextPage()
        animateControlsIfNeeded()
    }
    
    @objc func backTapped(_ sender: UIButton) {
        pageControl.currentPage -= 1
        goToSpecificPage(index: pageControl.currentPage, ofViewControllers: pages)
        animateControlsIfNeeded()
    }
    

}

// MARK: - Extensions

extension UIPageViewController {

    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
        
        setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}

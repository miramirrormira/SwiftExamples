//
//  ViewController.swift
//  ScrollToItemDemo
//
//  Created by Mira Colly on 2/9/21.
//

import UIKit

struct Section {
    let type: SectionType
    let details: [String]
}

enum SectionType {
    case titles
    case details
}

class ViewController: UIViewController {
    
    var collectionView: UICollectionView! = nil
    
    var sections = [Section]()
    
    var scrollToItemWorkaroundFlag = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupCollectionView()
        generateSections()
    }

    func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { section, _ -> NSCollectionLayoutSection? in
            return self.layout(for: section)
        }
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        self.collectionView = collectionView
    }
    
    func generateSections() {
        sections.append(Section(type: .titles, details: ["one","two","three","four"]))
        sections.append(Section(type: .details, details: ["1","2","3","4"]))
    }
    
    func layout(for section: Int) -> NSCollectionLayoutSection {
        
        let sectionType = sections[section].type
        
        switch sectionType {
            
            case .titles:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2)), subitem: item, count: sections[section].details.count)
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .details:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.8)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = scrollToItemWorkaroundFlag ? .continuousGroupLeadingBoundary :  .groupPagingCentered
                return section
        }
        
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].details.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("cannot create cell") }
        
        cell.label.text = sections[indexPath.section].details[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionType = sections[indexPath.section].type
        switch sectionType {
            case .titles:
                scrollToItemWorkaroundFlag = true
                collectionView.collectionViewLayout.invalidateLayout()
                collectionView.scrollToItem(at: IndexPath(row: indexPath.row, section: 1), at: .centeredHorizontally, animated: true)
                scrollToItemWorkaroundFlag = false
                collectionView.collectionViewLayout.invalidateLayout()
            default:
                break
        }
    }
}


extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(),
                       green: .random(),
                       blue: .random(),
                       alpha: 1.0)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

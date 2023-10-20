//
//  PageViewController.swift
//  LandMarks
//
//  Created by 황재영 on 2023/09/19.
//

import SwiftUI
import UIKit


struct PageViewController<Page: View>: UIViewControllerRepresentable {
    // UIViewControllerRepresentable = UIKit의 UIViewController를 사용하려 할때 사용되는 프로토콜
    var pages: [Page]


    func makeCoordinator() -> Coordinator {
        Coordinator(self) // 하단에 존재하는 class Coordinator 참조
    }


    func makeUIViewController(context: Context) -> UIPageViewController {
        // UIPageViewController =. UIViewControllerRepresentable 를 사용하여 사용가능해진 UIKit 프로토콜
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator


        return pageViewController
    }


    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }


    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        var controllers = [UIViewController]()


        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }


        func pageViewController(
            _ pageViewController: UIPageViewController, 
            // UIPageViewController함수 내에서 pageViewController 매개변수를 사용할 필요가 없음을 컴파일러에 설정 -> 프로토콜이나 API에 필요하지만 실제로 함수 구현 내에서 사용되지 않는 매개변수가 있는 경우 코드를 더 간결하고 읽기 쉽게 만듬
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }


        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
    }
}


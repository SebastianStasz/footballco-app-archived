//
//  NewsDetailsVM.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Combine
import Foundation

final class NewsDetailsVM: ViewModel {

    @Published private(set) var isLoading = true

    let article: Article
    @Published private(set) var attrString: AttributedString?

    init(coordinator: CoordinatorProtocol?, article: Article) {
        self.article = article
        super.init(coordinator: coordinator)
    }

    override func viewDidLoad() {
        Just(article)
            .receive(on: DispatchQueue.global())
            .map { article -> AttributedString? in
                guard let data = article.content.data(using: .unicode),
                      let attrString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                else { return nil }
                return AttributedString(attrString)
            }
            .receive(on: DispatchQueue.main)
            .sinkAndStore(on: self) { vm, attrString in
                vm.isLoading = false
                vm.attrString = attrString
            }
    }
}

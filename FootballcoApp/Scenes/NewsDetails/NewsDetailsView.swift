//
//  NewsDetailsView.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Kingfisher
import SwiftUI

struct NewsDetailsView: View {

    @ObservedObject var viewModel: NewsDetailsVM

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                Text(viewModel.article.title)
                    .font(.title)

                KFImage(viewModel.article.url)
                    .placeholder { ProgressView() }
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(12)
                    .clipped()

                if viewModel.isLoading {
                    ProgressView()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    if let content = viewModel.attrString {
                        Text(content)
                    } else {
                        Text("Ups. 😭 Failed to load news content.")
                    }
                }
            }
            .padding(16)
        }
    }
}

struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NewsDetailsVM(coordinator: nil, article: .sample)
        NewsDetailsView(viewModel: viewModel)
        NewsDetailsView(viewModel: viewModel)
            .preferredColorScheme(.dark)
    }
}

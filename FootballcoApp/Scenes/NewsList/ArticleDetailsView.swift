//
//  ArticleDetailsView.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Kingfisher
import SwiftUI

struct ArticleDetailsView: View {

    let article: Article
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                KFImage(article.url)
                    .placeholder { ProgressView() }
                    .onFailureImage(.strokedCheckmark)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80)
                    .cornerRadius(12)
                    .clipped()

                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                        .lineLimit(2)

                    Spacer()

                    HStack {
                        Text(article.date)
                        Spacer()
                        Text(article.time)
                    }
                    .font(.footnote)
                }
            }
        }
        .buttonStyle(.plain)
        .frame(height: 80)
        .padding(16)
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArticleDetailsView(article: .sample, onTap: {})
            ArticleDetailsView(article: .sample, onTap: {})
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}

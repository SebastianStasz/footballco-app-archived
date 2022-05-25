//
//  NewsListRowView.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Kingfisher
import SwiftUI

struct NewsListRowView: View {

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
            .frame(height: 80)
            .padding(16)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

struct NewsListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsListRowView(article: .sample, onTap: {})
            NewsListRowView(article: .sample, onTap: {})
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}

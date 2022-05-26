//
//  EmptyListView.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 26/05/2022.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "wind")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text("Looks like there is no news for today :)")
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 500)
        .opacity(0.5)
        .listRowSeparator(.hidden)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}

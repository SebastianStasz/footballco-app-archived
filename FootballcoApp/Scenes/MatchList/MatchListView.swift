//
//  MatchListView.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import SwiftUI

struct MatchListView: View {

    @ObservedObject var viewModel: MatchListVM

    var body: some View {
        Text("Match List View")
    }
}

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView(viewModel: .init())
    }
}

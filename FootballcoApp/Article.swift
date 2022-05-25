//
//  Article.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Foundation

struct Article: Identifiable {
    let id: String
    let title: String
    let content: String
    let date: String
    let time: String
    let url: URL?
}

extension Article {
    init(from model: ArticleModel) {
        let publishedDate = Date(timeIntervalSince1970: model.publishedTime)
        id = model.id
        title = model.headline
        content = model.body
        date = publishedDate.string(format: "dd.MM.yy")
        time = publishedDate.getTime()
        url = URL(string: model.imageUrl)
    }

    static let sample = Article(id: "1", title: "Chelsea prepare new Lukaku bid of up to €130m", content: "<p>Chelsea are preparing a new bid for Inter striker Romelu Lukaku of up to €130 million (£111m/$154m), <strong>Goal</strong> can confirm.</p>\n\n<p>Lukaku is being tipped to return to Stamford Bridge this summer as Thomas Tuchel seeks to bolster his attacking options at Chelsea ahead of his first full season in charge.</p>\n\n<p><strong>Goal</strong> has reported that the Blues have already seen <a href=\"https://www.goal.com/en/news/inter-would-consider-lukaku-sale-at-120m-after-rejecting-chelsea-/sig4nwnnobz71i0p0b6wup1wp\" target=\"_blank\">an opening offer of €100m (£85m/$119m) for the Belgian rejected</a>, which included Spanish full-back, Marcos Alonso, as a potential makeweight.</p>\n\n<h3>What's the situation?</h3>\n\n<p>Chelsea are now willing to offer between €120m and €130m to land Lukaku, with Inter likely to accept a fee within that region as they continue to negotiate their way through a financial crisis.</p>\n\n<p>Whether or not the 28-year-old signs for the Blues could now come down to final negotiations on the structure of the deal, but plans are already being made for his arrival in west London.</p>\n\n<p><strong>Goal</strong> has learned that Chelsea are looking at viable exit strategies for Tammy Abraham as they close in on Lukaku, with Aston Villa eager to bring in the England international on loan.</p>\n\n<p>However, Chelsea would prefer that Abraham departs on a permanent basis, and they would like to earn around £40m ($56m) from his sale.</p>\n\n<h3>The bigger picture</h3>\n\n<p>Lukaku's first spell at Chelsea between 2011 and 2013 saw him fail to score a single goal in 15 senior appearances, but he went on to establish himself as one of the top forwards in the Premier League at Everton.</p>\n\n<p>The Belgium international was then snapped up by Manchester United in 2017, and he hit 42 goals in 96 games for the club, albeit without ever quite managing to live up to the lofty expectations at Old Trafford.</p>\n\n<p>The Red Devils took the decision to sell Lukaku to Inter for £74m ($103m) in the summer of 2019, and he has taken his game to new heights in Italy, recording 64 goals in 95 appearances while becoming a Serie A title winner.</p>\n\n<p>Should Chelsea manage to re-sign the Inter star, they will be getting a far more experienced player than the one they had 10 years ago, and his presence could prove crucial as Tuchel's side aim to fight for the Premier League title in 2021-22.</p>\n\n<h3>Further reading</h3>\n\n<ul>\n\t<li><a href=\"https://www.goal.com/en-gb/news/inter-would-consider-lukaku-sale-at-120m-after-rejecting-chelsea-/sig4nwnnobz71i0p0b6wup1wp\" target=\"_blank\">Inter would consider Lukaku sale at €120m</a></li>\n\t<li><a href=\"https://www.goal.com/en-gb/news/lukaku-thrilled-to-be-back-at-inter-as-striker-returns-to/d8v5jvakq3rt17jpoochi8ipq\" target=\"_blank\">Lukaku 'thrilled to be back' at Inter following transfer rumours</a></li>\n\t<li><a href=\"https://www.goal.com/en-gb/news/lukaku-is-not-for-sale-inter-ceo-says-amid-interest-from-chelsea-/78ievpjy17b511jeypanlm9sc\" target=\"_blank\">Inter CEO Marotta: Lukaku is not for sale</a></li>\n</ul>\n", date: "25.05.2022", time: "17:06", url: URL(string: "https://images.daznservices.com/di/library/GOAL/f2/ca/romelu-lukaku-inter-chelsea-badge_1f4zad4ox2ai319tycmid5lr91.jpg?t=213114555")!)
}

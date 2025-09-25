//
//  ReeshionApp.swift
//  Reeshion
//
//  Created by Hao Tran on 30/8/25.
//

import SwiftUI
import CoreNetworking
import DomainProducts
import FeaturesHome
import DataProducts
import CoreTheme

@main
struct ReeshionApp: App {
    @Environment(\.appTheme) private var theme
    
    var body: some Scene {
        WindowGroup {
            let baseURL = URL(string: "https://api.reetro.vn/")!

            let client = URLSessionNetworkClient()
            let repo: ProductRepository = ProductsRepositoryImpl(baseURL: baseURL, client: client)
            let fetchProducts = FetchProductsUseCase(repo: repo)
            let homeVM = HomeViewModel(fetchProducts: fetchProducts)
            ThemeContainer {
                HomeView(viewModel: homeVM)
            }
        }
    }
}

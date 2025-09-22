import SwiftUI
import DomainProducts

public struct HomeView: View {
    @StateObject private var vm: HomeViewModel

    public init(viewModel: HomeViewModel) {
        _vm = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading && vm.items.isEmpty {
                    ProgressView("Loading…")
                } else {
                    List(vm.items) { p in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(p.name).font(.headline)
                                Text(format(price: p.price)).font(.subheadline)
                            }
                            Spacer()
                            AsyncImage(url:p.imageURL)
                        }
                    }
                }
            }
            .navigationTitle("Home")
        }
        .task { await vm.loadFirstPage() }
    }

    private func format(price: Decimal) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.currencyCode = "USD"
        return nf.string(from: price as NSDecimalNumber) ?? "\(price)"
    }
}

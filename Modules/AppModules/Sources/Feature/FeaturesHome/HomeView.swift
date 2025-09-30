import SwiftUI
import DomainProducts
import CoreTheme
import CommonViews

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
                        ProductItem(product: p)
                    }
                }
            }
            .navigationTitle("Home")
        }
        .task { await vm.loadFirstPage() }
    }
}


public struct ProductItem: View {
    @Environment(\.appTheme) private var theme
    let product:Product
    
    public init(product:Product){
        self.product = product
    }
    
    public var body: some View {
                HStack() {
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title)
                Text(format(price: product.price)).font(.subheadline)
                Text(format(price: product.price)).font(.caption)
                Text(format(price: product.price)).font(.body)
                Text(format(price: product.price))
                    .font(.footnote)
                Text(format(price: product.price))
                    .font(.caption2)
                PrimaryButton(label:"Click me") {
                       print("Button tapped")
                   }
            }.frame(minWidth:200).allowsHitTesting(false)
            Spacer()
            AsyncImage(url:product.imageURL).frame(width:200 ,height: 200).scaledToFit().clipped(antialiased: true)
                }.allowsHitTesting(false)
    }
    
    private func format(price: Decimal) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.currencyCode = "USD"
        return nf.string(from: price as NSDecimalNumber) ?? "\(price)"
    }
}

#Preview {
    ProductItem(product:productMock)
}

let productMock = Product(id: "1121", name: "Quần Kaki Dancer", price: 200000, imageURL:URL(string:"https://reetro.vn/wp-content/uploads/2024/12/vn-11134208-7ras8-m1idl8t8uenz9b.jpg"))

module ProductsHelper
    def price_with_vat(price)
        price * 1.23 unless price == nil
    end
end

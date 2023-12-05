module ProductsHelper
  def product_cover(product, variant)
    if product.cover.attached?
      image_tag product.cover.variant(variant)
    else
      image_tag "/images/product/default.jpg", style: "height:300px;"
    end
  end
end

class QuoteProductDecorator < ApplicationDecorator
  delegate_all

  def name
    if amount == 1
      product.try(:humanize)
    else
      product.try(:humanize).try(:pluralize)
    end
  end
end


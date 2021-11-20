class QuoteProductDecorator < ApplicationDecorator
  delegate_all

  def name
    if name = blank_blue_ray_disk?
      "Blank Blue-Ray disk"
    elsif amount == 1
      product.try(:humanize)
    else
      product.try(:humanize).try(:pluralize)
    end
  end
end


class QuoteProductDecorator < ApplicationDecorator
  delegate_all

  def name
    if blank_blue_ray_disk? && amount == 1
      "Blank Blue-Ray disk"
    elsif blank_blue_ray_disk? && amount > 0
      "Blank Blue-Ray disks"
    elsif amount == 1
      product.try(:humanize)
    elsif amount > 0
      product.try(:humanize).try(:pluralize)
    else
      0
    end
  end
end


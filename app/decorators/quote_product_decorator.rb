class QuoteProductDecorator < ApplicationDecorator
  delegate_all

  def name
    if blank_blue_ray_disk? && amount == 1
      "Blank Blue-Ray disk"
    elsif blank_blue_ray_disk?
      "Blank Blue-Ray disks"
    elsif amount == 1
      product.try(:humanize)
    else
      product.try(:humanize).try(:pluralize)
    end
  end
end


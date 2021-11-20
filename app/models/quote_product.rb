class QuoteProduct < ApplicationRecord
  belongs_to :quote

  #UPDATE to correct price
  enum product: { "book" => 0.5, "face_mask" => 1, "first_aid_kit" => 10, "blank_blue-ray_disk" => 5 }

  validates :product, :amount, presence: true
  validates :amount, inclusion: (1..9999)

  def cost
    tax_free_cost + tax + import_duty
  end

  def tax_free_cost
    amount * individual_cost
  end

  def individual_cost
    if product
      QuoteProduct.products[product]
    end
  end

  def tax
    if book?
      tax_free_cost * 0.1
    else
      0
    end
  end

  def import_duty
    if book? || face_mask?
      tax_free_cost * 0.05
    else
      0
    end
  end
end
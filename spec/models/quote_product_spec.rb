require 'rails_helper'

RSpec.describe QuoteProduct, type: :model do
  let(:product) { described_class.new }

  describe '.validations' do
    it { is_expected.to validate_presence_of(:product) }
    it { is_expected.to validate_presence_of(:amount) }
  end

  describe 'cost' do
    context 'when book' do
      before { product.product = :book }

      it 'cost $0.5 plus tax of 10% and import duty 5%' do
        product.amount = 100

        expect(product.cost).to eq(57.5)
      end
    end

    context 'when face_mask' do
      before { product.product = :face_mask }

      it 'cost $1 plus and no tax and import duty 5%' do
        product.amount = 100

        expect(product.cost).to eq(105)
      end
    end

    context 'when first_aid_kit' do
      before { product.product = :first_aid_kit }

      it 'cost $1 plus and no tax and no import duty' do
        product.amount = 100

        expect(product.cost).to eq(1000)
      end
    end
  end

  describe 'tax_free_cost' do
    context 'when 5 first aid kits' do
      before { product.product = :first_aid_kit }

      it 'cost $10 per first aid kit and amount is 1000' do
        product.amount = 100

        expect(product.tax_free_cost).to eq(1000)
      end
    end

    context 'when 5 first aid kits' do
      before { product.product = :blank_blue_ray_disk }

      it 'cost $10 per blank Blue-Ray disk and amount is 5' do
        product.amount = 5

        expect(product.tax_free_cost).to eq(10)
      end
    end
  end

  describe 'individual_cost' do
    context 'when product is first_aid_kit' do
      before { product.product = :blank_blue_ray_disk }

      it 'get the price of blank_blue_ray_disk' do

        expect(product.individual_cost).to eq(2)
      end
    end
  end

  describe 'tax' do
    context 'when product is book' do
      before { product.product = :book }

      it 'calculate 10% tax for 100 books' do
        product.amount = 100

        expect(product.tax).to eq(5)
      end
    end

    context 'when product is blank Blue-Ray disk' do
      before { product.product = :blank_blue_ray_disk }

      it 'no tax for 5 Blue-Ray disks' do
        product.amount = 5

        expect(product.tax).to eq(0)
      end
    end
  end

  describe 'import_duty' do
    context 'when product is book' do
      before { product.product = :book }

      it 'calculate 5% import_duty for 100 books' do
        product.amount = 100

        expect(product.tax).to eq(5)
      end
    end

    context 'when product is blank Blue-Ray disk' do
      before { product.product = :blank_blue_ray_disk }

      it 'no import_duty for 5 Blue-Ray disks' do
        product.amount = 5

        expect(product.tax).to eq(0)
      end
    end
  end

  describe 'special_tax' do
    context 'when product is book' do
      before { product.product = :book }

      it 'np special tax for 100 books' do
        product.amount = 100

        expect(product.special_tax).to eq(0)
      end
    end

    context 'when product is blank Blue-Ray disk' do
      before { product.product = :blank_blue_ray_disk }

      it 'Add 2% import_duty for 1 Blue-Ray disks' do
        product.amount = 1

        expect(product.special_tax).to eq(0.04)
      end
    end
  end
end

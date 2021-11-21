require 'rails_helper'

RSpec.describe QuoteDecorator do
    let(:decorator_first_aid_kit) { QuoteProductDecorator.new(first_aid_kit) }
    let(:decorator_book) { QuoteProductDecorator.new(book) }
    let(:decorator_blank_blue_ray_disk) { QuoteProductDecorator.new(blank_blue_ray_disk) }

    let(:first_aid_kit) { QuoteProduct.create( :product => 'first_aid_kit', :amount => 5 ) }
    let(:book) { QuoteProduct.create( :product => 'book', :amount => 1 ) }
    let(:blank_blue_ray_disk) { QuoteProduct.create( :product => 'blank_blue_ray_disk', :amount => 4 ) }
    
    describe 'test decorator for product' do
        it 'When product is first aid kits, and amount more than 1' do
            expect((decorator_first_aid_kit).name).to eq "First aid kits"
        end

        it 'When product is only one book' do
            expect((decorator_book).name).to eq "Book"
        end

        it 'When product 4 Blank Blue-Ray disks' do
            expect((decorator_blank_blue_ray_disk).name).to eq "Blank Blue-Ray disks"
        end
    end
end

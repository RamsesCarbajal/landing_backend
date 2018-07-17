require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Customer Model' do
    context 'valid customer' do
      it 'with all params' do
        customer = build(:customer)
        expect(customer).to be_valid
      end
    end
    context 'invalid customer' do
      context 'name' do
        it 'invalid' do 
          customer = build(:customer, name: 'bad name4.')
          customer.valid?

          expect(customer.errors.messages[:name]).to include('is invalid')
          expect(customer).to_not be_valid
        end

        it 'nil' do
          customer = build(:customer, name: nil)
          customer.valid?

          expect(customer.errors.messages[:name]).to include("can't be blank")
          expect(customer).to_not be_valid
        end

      end
      context 'last_name' do
        it 'invalid' do 
          customer = build(:customer, name: 'bad name4.')
          customer.valid?

          expect(customer.errors.messages[:name]).to include('is invalid')
          expect(customer).to_not be_valid
        end

        it 'nil' do
          customer = build(:customer, name: nil)
          customer.valid?

          expect(customer.errors.messages[:name]).to include("can't be blank")
          expect(customer).to_not be_valid
        end

      end
      context 'phone' do
        it 'invalid' do 
          customer = build(:customer, phone: 'bad name4.')
          customer.valid?

          expect(customer.errors.messages[:phone]).to include('is invalid')
          expect(customer).to_not be_valid
        end
        it 'nil' do
          customer = build(:customer, phone: nil)
          customer.valid?

          expect(customer.errors.messages[:phone]).to include("can't be blank")
          expect(customer).to_not be_valid
        end
      
      end
      context 'email' do
        it 'invalid' do
          customer = build(:customer, email: 'invalid email')
          customer.valid?

          expect(customer.errors.messages[:email]).to include("invalid format")
          expect(customer).to_not be_valid
        end
        it 'nil' do
          customer = build(:customer, email: nil)
          customer.valid?

          expect(customer.errors.messages[:email]).to include("can't be blank")
          expect(customer).to_not be_valid
        end
      end
      context 'comment' do
        it 'invalid' do
          customer = build(:customer, comment: 'inva*****')
          customer.valid?

          expect(customer.errors.messages[:comment]).to include("is invalid")
          expect(customer).to_not be_valid
        end
        it 'nil' do
          customer = build(:customer, comment: nil)
          customer.valid?

          expect(customer.errors.messages[:comment]).to include("is invalid")
          expect(customer).to_not be_valid
        end
        it 'less than 10 characters' do
          customer = build(:customer, comment: 'less')
          customer.valid?

          expect(customer.errors.messages[:comment]).to include("have_to_be_greater_than_10")
          
          expect(customer).to_not be_valid
       
        end
        it 'more than 200 characters' do
          customer = build(:customer, comment: 'x'*210)
          customer.valid?

          expect(customer.errors.messages[:comment]).to include("have_to_be_less_than_200")
          expect(customer).to_not be_valid
        end

      end

    end
  end
end

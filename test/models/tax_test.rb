class TaxTest < ActiveSupport::TestCase

    def setup
        @tax = Tax.create(annual_income: 45600, tax_year: 2020)
    end

    test 'valid tax' do
        assert @tax.valid?
    end

    test "should not create tax without annual income" do
        tax = Tax.create({tax_year: 2020})
        assert_not tax.valid?
      end

      test "should not create tax without tax year" do
        tax = Tax.create({annual_income: 20200})
        assert_not tax.valid?
      end

      test 'invalid without numeric amt' do
        @tax.annual_income = "test_val"
        refute @tax.valid?, 'tax is valid without a income'
        assert_not_nil @tax.errors[:annual_income], 'no validation error for amt type'
      end

      test 'invalid without numeric year' do
        @tax.tax_year = "test val"
        refute @tax.valid?, 'tax is valid without a tax_year'
        assert_not_nil @tax.errors[:tax_year], 'no validation error for year type'
      end

      test 'invalid without a valid year' do
        @tax.tax_year = 1998
        refute @tax.valid?
        assert_not_nil @tax.errors[:tax_year]
      end
  end
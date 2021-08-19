class Tax 
   include ActiveModel::Model, ApiServices, ActiveModel::Serializers::JSON

    attr_accessor :annual_income, :tax_year, :rate, :tax_estimate

    validates :annual_income, 
    numericality: { only_integer: true , 
    message: "annual income should be of type number" }, 
    presence: true

    validates :tax_year, 
    numericality: { only_integer: true , 
    message: "tax year should be of type number" }, 
    presence: true

    validates_with TaxValidator

    def initialize(attr={})
        super
        @rate ||= 0.00
        @tax_estimate ||= 0.00
    end

    def attributes
        {'annual_income' => nil,
        'tax_year' => nil,
        'rate' => nil,
        'tax_estimate' => nil}
      end
    
    def self.create(tax_params)
        Tax.new(tax_params) 
    end

    def update_rate
        begin
            margin_lists = fetch_margin(@tax_year)
            set_margins(self , margin_lists) 
            Rails.logger.info "update_rate:: info------> #{margin_lists}  has been returned"
        rescue => exception
            Rails.logger.info "update_rate:: error------> #{exception}  has been returned"
            raise Exception.new "This is an exception"
        end
     end

    def estimate_tax
        @tax_estimate = @annual_income * @rate
    end

end
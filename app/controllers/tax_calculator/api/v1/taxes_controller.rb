module TaxCalculator::Api::V1
    class TaxesController < ApplicationController
       

        def calculate
            @tax = Tax.create(tax_params)
            if @tax.valid?
                    @tax.update_rate
                    @tax.estimate_tax
                 render json: {info: @tax.as_json, status: "Success"}
            else  
                render json: {message: @tax.errors.messages, status: "Error"}, status: 400
            end
        end
    
        private
        def tax_params
            params.permit(:annual_income, :tax_year)
        end
    end
end

module ApiServices 
    extend ActiveSupport::Concern
    include HTTParty

    Api_url = Rails.application.config.api_url
    
        def fetch_margin(tax_year)
            begin
                result = nil
                response = HTTParty.get("#{Api_url}#{tax_year}")
                Rails.logger.info "HTTParty:: info------> #{response.code}  has been returned"
                result = response.parsed_response["tax_brackets"]
            rescue HTTParty::Error
                Rails.logger.error "HTTParty::Error------> #{response.code} #{HTTParty::Error} has been returned"
                raise Exception.new "This is an exception"
            rescue StandardError
                Rails.logger.error "HTTParty::Error------> #{response.code} #{StandardError} has been returned"
                raise Exception.new "This is an exception"
            end

        end

        def set_margins(tax_details , tax_list)
            tax_rate = nil
            tax_list.each do |range|
                max = range["max"] ? range["max"].to_i : nil
                min = range["min"] ? range["min"].to_i : 0
                if (min..max).include?tax_details.annual_income
                    tax_rate = range["rate"].to_f
                end
            end
            tax_details.rate = tax_rate ? tax_rate : 0.00
        end




    


end
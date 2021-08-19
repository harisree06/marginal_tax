class TaxValidator < ActiveModel::Validator
    Start_date = Rails.application.config.api_year_start
    End_date = Rails.application.config.api_year_end


    def validate(record)
    !(Start_date..End_date).include?(record.tax_year.to_i) && record.errors.add(:tax_year, "Info unavailable for the year #{record.tax_year}")
    end
  end
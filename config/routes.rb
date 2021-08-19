Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 

  namespace :tax_calculator do
    namespace :api do
      namespace :v1 do
        post "estimateTax" => 'taxes#calculate'
      end
    end
  end
end

class CategoriesController < ApplicationController
  def index
    render json: {
      categories: [
        'Cottage',
        'Mansion',
        'Lodge',
        'Country home',
        'Chalet',
        'Log cabin'
      ]
    }
  end
end

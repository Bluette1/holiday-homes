class CategoriesController < ApplicationController
  def index
    render json: {
      categories: [
        'cottage',
        'mansion',
        'lodge',
        'country home',
        'chalet',
        'log cabin'
      ]
    }
  end
end

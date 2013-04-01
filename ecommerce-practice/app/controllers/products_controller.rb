class ProductsController < ApplicationController
  before_filter :is_admin, :only => [:new, :create]
  def new
    @product = Product.new
  end

  def create
    product = Product.create(params[:product])
    params[:tags].split(', ').each do |tag|
      tag = Tag.find_or_create_by_name(tag.squish)
      product.tags << tag
    end
    @products = Product.all
  end

  def search
    query = params[:query]
    @products = Product.where( "name @@ :q or description @@ :q or image @@ :q or address @@ :q", q: query )
    render :search
  end
end
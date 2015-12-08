class BookTablesController < ApplicationController
  before_action :set_book_table, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @book_tables = BookTable.all
    respond_with(@book_tables)
  end

  def show
    respond_with(@book_table)
  end

  def new
    @book_table = BookTable.new
    respond_with(@book_table)
  end

  def edit
  end

  def create
    @data = false
    if !current_user.blank?
      @user = current_user
      @book_table = BookTable.new(book_table_params)
      @book_table.user_id = @user.id
      @book_table.save
      @data = false
    end
    respond_to do |format|
      format.html
      format.json {render :json => {:status => @data}}
    end
  end

  def update
    @book_table.update(book_table_params)
    respond_with(@book_table)
  end

  def destroy
    @book_table.destroy
    respond_with(@book_table)
  end

  private
    def set_book_table
      @book_table = BookTable.find(params[:id])
    end

    def book_table_params
      params.require(:book_table).permit!
    end
end

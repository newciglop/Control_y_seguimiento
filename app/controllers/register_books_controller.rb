class RegisterBooksController < ApplicationController
  before_action :set_register_book, only: %i[ show edit update destroy ]

  # GET /register_books or /register_books.json
  def index
    @months = (Date.today - 1.year..Date.today).map(&:beginning_of_month).uniq.reverse.map{|dt| [dt.strftime("%Y-%m"), dt] }
    @search = if params[:search]
                Date.parse(params[:search])
              else
                Date.today
              end
    @inputs = params[:inputs] || ""

        @register_books = RegisterBook.by_month(@search).where(is_admin_control: true).where("(LOWER(create_user) like LOWER(?) OR LOWER(rol_responsible) like LOWER(?) OR LOWER(company) like LOWER(?) ) " ,"%#{@inputs}%","%#{@inputs}%","%#{@inputs}%").order('created_at desc')
  end

  def index_offer
    @register_books_offer =  RegisterBook.where(is_offer: true).order('create_time desc')
    end
  # GET /register_books/1 or /register_books/1.json
  def show
  end

  # GET /register_books/new
  def new
    @register_book = RegisterBook.new
  end

  # GET /register_books/1/edit
  def edit
  end

  # POST /register_books or /register_books.json
  def create
    @register_book = RegisterBook.new(register_book_params)

    respond_to do |format|
      if @register_book.save
        format.html { redirect_to @register_book, notice: "Register book was successfully created." }
        format.json { render :show, status: :created, location: @register_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @register_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register_books/1 or /register_books/1.json
  def update
    respond_to do |format|
      if @register_book.update(register_book_params)
        format.html { redirect_to @register_book, notice: "Register book was successfully updated." }
        format.json { render :show, status: :ok, location: @register_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @register_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register_books/1 or /register_books/1.json
  def destroy
    @register_book.destroy
    respond_to do |format|
      format.html { redirect_to register_books_url, notice: "Register book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_book
      @register_book = RegisterBook.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def register_book_params
      params.require(:register_book).permit(:offer_id, :admin_control_id,
                                            :create_user, :update_user, :destroy_user, :update_time,:create_time,
                                            :destroy_time, :time_destroy,:modality_sl,:status_sl,:company)
    end
end

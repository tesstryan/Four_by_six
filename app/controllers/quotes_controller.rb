class QuotesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :new, :create, :download]


  def index
    # @quotes = Quote.all
    # @quote = Quote.find_by(id: params[:id])
    @quote = Quote.find_by(id: params[:id])
  end

  def show
    @quote = Quote.find_by(id: params[:id])
  end

  def new
  end

  def create
    @quote = Quote.new
    @quote.content = params[:content]
    @quote.template = params[:template]
    @quote.color = params[:color]
    @quote.font_size = params[:font_size]
    @quote.font = params[:font]
    @quote.alignment = params[:alignment]
    @quote.author = params[:author]


    if current_user.present?
      @quote.user_id = current_user[:id]
    end

    if @quote.save
      redirect_to quote_url(@quote.id)
    else
      render 'new'
    end
  end




  # def edit
  #   @quote = Quote.find_by(id: params[:id])
  # end

  # def update
  #   @quote = Quote.find_by(id: params[:id])
  #   @quote.content = params[:content]
  #   @quote.template = params[:template]
  #   @quote.color = params[:color]
  #   @quote.font_size = params[:font_size]
  #   @quote.font = params[:font]
  #   @quote.alignment = params[:alignment]
  #   @quote.author = params[:author]
  #   @quote.user_id = params[:user_id]

  #   if @quote.save
  #     redirect_to quotes_url
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
    @quote = Quote.find_by(id: params[:id])
    @quote.destroy

    respond_to do |format|
      format.html do
        redirect_to user_url(current_user[:id]), notice: "Quote deleted."
      end
      format.js
    end


  end

  def download
    @quote = Quote.find(params[:quote])
    html = render_to_string(action: quote_path(@quote), layout: 'application', template: 'quotes/show')
    kit = PDFKit.new(html)
    kit.stylesheets << "#{Rails.root}/public/pdf.css"
    # kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"
    send_data(kit.to_pdf, filename: "fourbysix#{@quote.id}", type: "application/pdf")
  end


end

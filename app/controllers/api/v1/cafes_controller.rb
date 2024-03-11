class Api::V1::CafesController < ApplicationController

  def index
    @cafes = Cafe.all
    if params[:title].present?
      @cafes = @cafes.where('title ILIKE ?', "%#{params[:title]}%")
    else
      @cafes = Cafe.all
      # we don't render HTML
      # render 'index.html.erb'
      render json: @cafes.order(created_at: :desc)
    end
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      render json: @cafe, status: :created
    else
      render json: { error: @cafe.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def cafe_params
    # An example of what our Postman request needs to send
    # {
    #   'cafe': {
    #     'title': 'Le Wagon Tokyo',
    #     'address': '2-11-3 Meguro Meguro-ku Tokyo',
    #     'picture': "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Fpremium-photo%2Fcafe-with-large-window-table-with-chairs_44638760.htm&psig=AOvVaw3gPM2BUjueoMTa6tvU9BWe&ust=1710256832253000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCIjspq3B7IQDFQAAAAAdAAAAABAE",
    #     "criteria": ["Stable Wi-Fi", "Power sockets", "Coffee", "Food"],
    #     "hours": {
    #       "Mon": ["10:30 – 18:00"],
    #       "Tue": ["10:30 – 18:00"],
    #       "Wed": ["10:30 – 18:00"],
    #       "Thu": ["10:30 – 18:00"],
    #       "Fri": ["10:30 – 18:00"],
    #       "Sat": ["10:30 – 18:00"]
    #     }
    #   }
    #   }
    params.require(:cafe).permit(:title, :address, :picture, hours: {}, criteria: [])
  end
end

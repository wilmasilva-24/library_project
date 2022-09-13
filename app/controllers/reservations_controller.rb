class ReservationsController < ApplicationController
  def index
    if params[:search].present?
      @reservations = Reservation.includes(:user, :book).references(:user, :book)
                                 .where(
                                  "users.name ILIKE :search_param OR books.title ILIKE :search_param ", 
                                  search_param: "%#{params[:search]}%"
                                  ).paginate(page: params[:page],per_page: 5)
    else 
      @reservations = Reservation.includes(:user, :book).paginate(page: params[:page],per_page: 5)
    end

    @reservations = @reservations.where(user: current_user) if current_user.common?
  end

  def new
    if current_user.admin? 
      @users = User.all.collect{|user| [user.name, user.id]}

    else
      @users = User.where(id: current_user.id).collect{|user| [user.name, user.id]}
    end
    @books = Book.all.collect{|book| [book.title, book.id]}
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.new(reservation_params)
    
    if reservation.save
      redirect_to reservations_path, notice: 'Livro reservado!'
    else
      render :new
    end
  end

  def edit
    @users = User.all.collect{|user| [user.name, user.id]}
    @books = Book.all.collect{|book| [book.title, book.id]}
    @reservation = Reservation.new
    authorize :reservation
  end

  def update
    reservation = Reservation.new(reservation_params)
    authorize reservation

    if reservation.update
      redirect_to reservations_path, notice: 'Reserva atualizada'
    else
      render :edit
    end
  end

  def finish
    reservation = Reservation.find(params[:id])
    authorize reservation

    if reservation.update(date_return: Date.current)
      redirect_to reservations_path, notice: 'Reserva finalizada!'
    else
      render :index
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:created_at, :date_return, :user_id, :book_id)
  end
end
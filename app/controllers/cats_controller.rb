class CatsController < ApplicationController
  before_action :set_cat, only: %i(upvote downvote)

  # GET /cats
  # Show one random cat
  def index
    set_random_cat

    respond_to do |format|
      format.html { render_react }
      format.json { render json: serialize_cat }
    end

    # render json: serialize_cat
  end

  def upvote
    respond_to :json

    if @cat.increment(:score)
      set_random_cat
      render json: serialize_cat
      return
    end

    render json: @cat.errors.full_messages, status: :bad_request
  end

  def downvote
    respond_to :json

    if @cat.decrement(:score)
      set_random_cat
      format.json { render json: serialize_cat }
      return
    end

    format.json { render json: @cat.errors.full_messages, status: :bad_request }
  end

  private

  def set_random_cat
    @cat = Cat.order('RANDOM()').take
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_cat
    @cat = Cat.find(params[:id])
  end

  def serialize_cat
    CatSerializer.new(@cat).serializable_hash
  end

  # Only allow a trusted parameter "white list" through.
  def cat_params
    params.require(:cat).permit(:image_url, :score)
  end
end

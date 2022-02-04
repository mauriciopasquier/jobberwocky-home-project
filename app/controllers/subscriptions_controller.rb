class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :destroy]

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      render :show, status: :created, location: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subscription_params
    params.require(:subscription).permit(
      :email, subscription_rules_attributes: [
        :subscription_id, :name, :id, :salary_min, :salary_max, :country,
        :skills, :_destroy
      ]
    )
  end
end

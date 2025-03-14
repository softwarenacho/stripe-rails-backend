class ConnectionTokensController < ApplicationController
  def create
    begin
      # Create the connection token using Stripe's API
      token = Stripe::Terminal::ConnectionToken.create

      # Respond with the secret of the connection token
      render json: { secret: token.secret }
    rescue Stripe::StripeError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end

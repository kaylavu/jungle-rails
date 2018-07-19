class UserMailer < ApplicationMailer

    default from: 'no-reply@jungle.com'
 
    def email_receipt(params)
      @email = params[:email]
      @order = params[:order]
      @line_items = @order.line_items.order(created_at: :desc) 
      mail(to: @email, subject: "Thank for your Order #{@order.id}")
    end
end

require 'sinatra'

get "/" do
  erb :index
end

set :cash_slot, CashSlot.new
set :account do
  fail "Account has not been set"
end

post "/withdraw" do
  teller = Teller.new settings.cash_slot
  teller.withdraw_from settings.account, params[:amount].to_i
end

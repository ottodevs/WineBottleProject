class HistoriesController < ApplicationController

  def create 

    binding.pry
    @addresses = History.find(params["address"]["address_id_for_history"]).addresses_for_map 
  end
    # #Needs to be triggered after a transaction 
    # history = History.new
    # address = params["address"]["sending_btc_address"]
    # history.address_id = params["address"]["address_id_for_history"]
    # History.history_array(address)
    # History.make_history(address) 
    # history.save
    # redirect_to users_path(current_user)
  end # ends create



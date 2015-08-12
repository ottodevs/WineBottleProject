class AddressesController < ApplicationController

  require 'bitcoin'
  Bitcoin.network = :testnet3

  def create  # following pressing 'register a new bottle' and then 'submit'
    @address = Address.new
    @address.user_id = current_user.id
    attrs_for_assignment = ["vineyard_name", "wine_type", "vintage", "provenance",
                          "brand_name", "designation", "stringified_description", "avatar"]            
    @address.attributes.each do |key, value|
      if attrs_for_assignment.include?(key)
        if !params["address"][key].nil?
          binding.pry
          value = params["address"][key] 
          
          value.strip
        end
      end
    end

    
    @address.assign_last_location(params)
    if @address.designation.present? && @address.brand_name.present?
      @address.stringified_description = "#{@address.vintage} #{@address.vineyard_name} #{@address.wine_type} from #{@address.provenance}, #{@address.designation} (#{@address.brand_name})"
    elsif @address.designation.present? 
      @address.stringified_description = "#{@address.vintage} #{@address.vineyard_name} #{@address.wine_type} from #{@address.provenance}, #{@address.designation}"
    elsif @address.brand_name.present?
      @address.stringified_description = "#{@address.vintage} #{@address.vineyard_name} #{@address.wine_type} from #{@address.provenance} (#{@address.brand_name})"
    else 
      @address.stringified_description = 
        "#{@address.vintage} #{@address.vineyard_name} #{@address.wine_type} from #{@address.provenance}."
    end
    binding.pry
    key_pair = Bitcoin::generate_key
    @address.private_key = key_pair[0]
    @address.public_key = key_pair[1]
    @address.btc_address = Bitcoin::pubkey_to_address(key_pair[1])

    @address.save
    new_address = @address
    WineFaucet.transfer_balance(new_address)
    redirect_to user_path(current_user)
  end

  def index
    @user_addresses = Addresses.find(params[:user_id])
  end


  private

  def address_params
    params.require(:address).permit(:avatar)
  end

end

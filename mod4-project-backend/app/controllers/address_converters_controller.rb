class AddressConvertersController < ApplicationController

    def create
        new_addr = addr_params[:adress].tr(" ", "+")
        geolocation = api_call("https://maps.googleapis.com/maps/api/geocode/json?address=#{new_addr}&key=#{ENV["MAPS_KEY"]}")
        AddressConverter.new(address: addr_params[:address], langt: geolocation)
    end

    private

    def addr_params
        params.require(:address_converter).permit(:address)
    end
end

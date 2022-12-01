class ApiController < ApplicationController
  def engineers
    engineers = Engineer.all

    render json: { engineers: engineers.map.to_json(include: [:first_agency, :second_agency]) }
  end
end

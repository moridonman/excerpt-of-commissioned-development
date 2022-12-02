class ApiController < ApplicationController
  def workers
    workers = Worker.all

    render json: { workers: workers.map.to_json(include: [:first_agency, :second_agency]) }
  end
end

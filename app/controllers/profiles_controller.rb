class ProfilesController < ApplicationController

def index
  render json: Profile.all
end

def show
  render json: Profile.find(params['id'])
end

def create
  render json: Profile.create(params['profile'])
end

def delete
  render json: Profile.delete(params['id'])
end

def update
  render json: Profile.update(params["user_id"], params['profile'])
end

end

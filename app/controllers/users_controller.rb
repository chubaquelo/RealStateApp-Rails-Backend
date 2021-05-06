class UsersController < ApplicationController
  before_action :authenticate_and_set_user, except: %i[index show]
  skip_before_action :verify_authenticity_token
end

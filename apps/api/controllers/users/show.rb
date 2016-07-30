module Api::Controllers::Users
  class Show
    include Api::Action

    expose :user

    def call(params)
      @user = UserRepository.find(params[:id])

      halt 404 if @user.nil?
    end
  end
end

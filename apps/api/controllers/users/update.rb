module Api::Controllers::Users
  class Update
    include Api::Action

    expose :user

    params do
      required(:id).filled(:str?)
      optional(:user).schema do
        optional(:name).filled(:str?)
        optional(:email).filled(:str?, format?: /@/)
      end
    end

    def call(params)
      halt 400 unless params.valid?

      @user = UserRepository.find(params[:id])

      if params[:user]
        @user.name  = params[:user][:name]  if params[:user][:name]
        @user.email = params[:user][:email] if params[:user][:email]
      end

      @user = UserRepository.update(@user)
    end
  end
end

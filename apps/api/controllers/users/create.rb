module Api::Controllers::Users
  class Create
    include Api::Action

    expose :user

    params do
      required(:user).schema do
        required(:name).filled(:str?)
        required(:email).filled(:str?, format?: /@/)
      end
    end

    def call(params)
      halt 400 unless params.valid?

      @user = UserRepository.create(User.new(params[:user]))
    end
  end
end

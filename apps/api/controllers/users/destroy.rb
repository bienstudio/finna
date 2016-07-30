module Api::Controllers::Users
  class Destroy
    include Api::Action

    expose :user

    params do
      required(:id).filled(:str?)
    end

    def call(params)
      halt 400 unless params.valid?

      @user = UserRepository.find(params[:id])
      @user = UserRepository.delete(@user)
    end
  end
end

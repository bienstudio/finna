Hanami::Model.migration do
  change do
    create_table :friendships do
      primary_key :id

      column :user_id,    Integer, null: false
      column :friend_id,  Integer, null: false
    end
  end
end

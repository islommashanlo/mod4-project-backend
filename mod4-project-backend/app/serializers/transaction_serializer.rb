class PlaidTokenSerializer < ActiveModel::Serializer
    attributes :id, :name, :user_id, :transaction_type_id
  end
  
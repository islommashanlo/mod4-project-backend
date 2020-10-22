class TransactionSerializer < ActiveModel::Serializer
    attributes :id, :name, :amount, :user_id, :category_id, :transaction_type_id, :t_date
end
  
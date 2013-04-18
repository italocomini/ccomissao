class Venda < ActiveRecord::Base

    belongs_to :user
    belongs_to :seguradora
    belongs_to :cliente
    has_many :comissaos

end

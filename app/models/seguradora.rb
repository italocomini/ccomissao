class Seguradora < ActiveRecord::Base
    validates_presence_of :nome, :message => 'é obrigatório'

    has_many :vendas

end

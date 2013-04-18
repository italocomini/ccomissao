class Cliente < ActiveRecord::Base
    
    validates_presence_of :nome ,:message => 'é um campo obrigatório'
    validates_presence_of :telefone ,:message => 'é um campo obrigatório'

    has_many :vendas

    def self.search(search)
        if search
            find(:all, :conditions => ['nome LIKE ?', "%#{search}%"])
        else
            find(:all)
        end
    end
    
end

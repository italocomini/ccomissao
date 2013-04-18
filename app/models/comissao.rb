class Comissao < ActiveRecord::Base
    belongs_to :venda

    validates_presence_of :venda_id
    validates_presence_of :data
    validates_presence_of :apolice
    validates_presence_of :parcela
    validates_presence_of :recebido
    validates_presence_of :cancelado
    validates_presence_of :retido
    validates_presence_of :comissao

    #validates_presence_of :username
    #validates_length_of :username, :within => 3..64

    def self.search(search)
        if search
            find(:all, :conditions => ['apolice LIKE ?', "%#{search}%"])
        else
            find(:all)
        end
    end

end

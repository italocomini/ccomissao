class Retirada < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :user_id
    validates_presence_of :data_retirada
    validates_presence_of :valor_retirada


end

class RelatorioController < ApplicationController
    def index

        sql = "select * from Comissaos where apolice = 123456789 "

        @comissaos = Comissao.find_by_sql(sql)

        #@comissaos = Comissao.find(:all)
        @vendas = Venda.find(:all)
        respond_to do |format|
            format.html
        end
    end

end

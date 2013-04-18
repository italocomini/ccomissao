ActionController::Routing::Routes.draw do |map|
    map.resources :retiradas

    map.resources :comissaos

    map.resources :vendas

    map.resources :clientes

    map.resources :relatorios

    map.resources :seguradoras

    map.root :controller => 'home'

    map.resources :users

    map.resources :home

    map.show_user '/user/:username',
        :controller => 'users',
        :action => 'show_by_username'

    map.resources :users, :member => { :enable => :put } do |users|
        users.resources :roles
    end
    
    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'
end

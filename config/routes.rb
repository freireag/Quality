ActionController::Routing::Routes.draw do |map|
  map.dashboard 'dashboard', :controller => :dashboard, :action => :index

  map.resources :frequencies, :as => "frequencias"

  map.resources :student_classes

  map.resources :admin_files, :as => "arquivos"

  map.resources :cities, :as => "cidades"

  map.devise_for :students, :as => "alunos", :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'cadastro', :password => 'senha'}

  map.resources :students, :as => "alunos" do |student|
    student.resources :student_classes, :as => "turmas"
  end

  map.resources :course_classes, :as => "turmas" do |course_class|
    course_class.resources :students, :as => "alunos"
    course_class.resources :frequencies, :as => "frequencias"
    course_class.resource :grades, :as => "notas"
    course_class.resources :exams, :as => "avaliacoes" do |exam|
      exam.resources :grades, :as => "notas"
    end
  end

  map.devise_for :users, :as => "usuarios", :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'cadastro', :password => 'senha'}
  map.new_user_session 'login', :controller => :sessions, :action => :new, :conditions => {:method => :get}
  map.user_session 'login', :controller => :sessions, :action => :create, :conditions => {:method => :post}
  map.destroy_user_session 'logout', :controller => 'sessions', :action => 'destroy', :conditions => { :method => :get }

  map.resources :users, :as => "usuarios"

  map.resources :courses, :as => "cursos"

  map.root :controller => :sessions, :action => :new
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end


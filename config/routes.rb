Coffi4::Application.routes.draw do
  resources :places, except: [:new, :edit] do
    resources :votes, only: [:create] do
      collection do
        delete :destroy
      end
    end
  end
end

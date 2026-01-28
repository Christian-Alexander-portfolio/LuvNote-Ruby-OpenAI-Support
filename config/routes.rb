Rails.application.routes.draw do
  root "chat#index"

  post "/chat", to: "chat#create"

  get "/support/:slug", to: "support#show", as: :support_page

  get "/admin", to: "admin#index"
  post "/admin/session", to: "admin#create_session"
  get "/admin/dashboard", to: "admin#dashboard"
  get "/admin/conversations/:id", to: "admin#conversation", as: :admin_conversation
end

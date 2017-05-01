Rails.application.routes.draw do
  get 'chats', to: 'chats#index', as: 'chats'

  get 'chats/:channel/new_message', to: 'chats#new_message', as: 'new_message'

  pst 'chats/:channel/send_message', to: 'chats#send_message' 


end

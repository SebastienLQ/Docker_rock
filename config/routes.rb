Rails.application.routes.draw do
  root 'welcome#index'

  resources 'containers'
  resources 'images'
  resources 'docker_files'
  resources 'search'
  resources 'error'
end

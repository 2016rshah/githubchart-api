Rails.application.routes.draw do
  get "/:username" => "chart#generate", format: :svg
end

Rails.application.routes.draw do
  # Route cho Blog
  get "/blog/:slug", to: "blog#show"  # Hiển thị bài blog với slug

  # Route cho greetings
  get "greetings/hello"  # Hiển thị lời chào

  # Route cho trang chủ
  get "home/index"  # Trang index của home

  # Kiểm tra trạng thái ứng dụng
  get "up" => "rails/health#show", as: :rails_health_check

  # Đặt lại root path
  root "products#index"  # Đặt trang chủ là danh sách sản phẩm

  # Định nghĩa các route cho các hành động CRUD của products
  resources :products  # Tự động tạo các route cho CRUD


end

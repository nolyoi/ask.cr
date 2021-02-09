class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    flash.each do |flash_type, flash_message|
      pp! flash_type
      if flash_type == "success"
        div class: "w-full bg-green-500 text-white my-2" do
          div class: "flex justify-between items-center container mx-auto py-4 px-6" do
            div class: "flex" do
              tag "svg", class: "h-6 w-6 fill-current", viewBox: "0 0 40 40" do
                tag "path", d: "M20 3.33331C10.8 3.33331 3.33337 10.8 3.33337 20C3.33337 29.2 10.8 36.6666 20 36.6666C29.2 36.6666 36.6667 29.2 36.6667 20C36.6667 10.8 29.2 3.33331 20 3.33331ZM16.6667 28.3333L8.33337 20L10.6834 17.65L16.6667 23.6166L29.3167 10.9666L31.6667 13.3333L16.6667 28.3333Z"
              end
              para flash_message, class: "mx-3"
            end
            button class: "rounded-md p-1 hover:bg-opacity-25 hover:bg-gray-600 focus:outline-none" do
              tag "svg", class: "h-5 w-5", fill: "none", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                tag "path", d: "M6 18L18 6M6 6L18 18", stroke: "currentColor", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
              end
            end
          end
        end
      elsif flash_type == "failure"
        div class: "w-full bg-red-500 text-white my-2" do
          div class: "flex justify-between items-center container mx-auto py-4 px-6" do
            div class: "flex" do
              tag "svg", class: "h-6 w-6 fill-current", viewBox: "0 0 40 40" do
                tag "path", d: "M20 3.36667C10.8167 3.36667 3.3667 10.8167 3.3667 20C3.3667 29.1833 10.8167 36.6333 20 36.6333C29.1834 36.6333 36.6334 29.1833 36.6334 20C36.6334 10.8167 29.1834 3.36667 20 3.36667ZM19.1334 33.3333V22.9H13.3334L21.6667 6.66667V17.1H27.25L19.1334 33.3333Z"
              end
              para flash_message, class: "mx-3"
            end
            button class: "rounded-md p-1 hover:bg-opacity-25 hover:bg-gray-600 focus:outline-none" do
              tag "svg", class: "h-5 w-5", fill: "none", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                tag "path", d: "M6 18L18 6M6 6L18 18", stroke: "currentColor", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
              end
            end
          end
        end
      else
        div class: "w-full bg-blue-500 text-white my-2" do
          div class: "flex justify-between items-center container mx-auto py-4 px-6" do
            div class: "flex" do
              tag "svg", class: "h-6 w-6 fill-current", viewBox: "0 0 40 40" do
                tag "path", d: "M20 3.33331C10.8 3.33331 3.33337 10.8 3.33337 20C3.33337 29.2 10.8 36.6666 20 36.6666C29.2 36.6666 36.6667 29.2 36.6667 20C36.6667 10.8 29.2 3.33331 20 3.33331ZM21.6667 28.3333H18.3334V25H21.6667V28.3333ZM21.6667 21.6666H18.3334V11.6666H21.6667V21.6666Z"
              end
              para flash_message, class: "mx-3"
            end
            button class: "rounded-md p-1 hover:bg-opacity-25 hover:bg-gray-600 focus:outline-none" do
              tag "svg", class: "h-5 w-5", fill: "none", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                tag "path", d: "M6 18L18 6M6 6L18 18", stroke: "currentColor", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
              end
            end
          end
        end
      end
    end
  end
end

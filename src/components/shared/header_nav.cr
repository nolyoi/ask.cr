class Shared::HeaderNav < BaseComponent
  needs current_user : User
  
  def render_links
    a "About", class: "mx-2 mt-2 md:mt-0 px-2 py-1 text-sm text-gray-700 dark:text-gray-200 font-medium rounded-md hover:bg-gray-300 dark:hover:bg-gray-700", href: "#"
    link "Questions", to: Questions::Index, class: "mx-2 mt-2 md:mt-0 px-2 py-1 text-sm text-gray-700 dark:text-gray-200 font-medium rounded-md hover:bg-gray-300 dark:hover:bg-gray-700"
    link "Tags", to: Tags::Index, class: "mx-2 mt-2 md:mt-0 px-2 py-1 text-sm text-gray-700 dark:text-gray-200 font-medium rounded-md hover:bg-gray-300 dark:hover:bg-gray-700"
    a "Contact", class: "mx-2 mt-2 md:mt-0 px-2 py-1 text-sm text-gray-700 dark:text-gray-200 font-medium rounded-md hover:bg-gray-300 dark:hover:bg-gray-700", href: "#"
    a "Crystal Lang", href: "https://crystal-lang.org/", target: "_blank", class: "mx-2 mt-2 md:mt-0 px-2 py-1 text-sm text-gray-700 dark:text-gray-200 font-medium rounded-md hover:bg-gray-300 dark:hover:bg-gray-700"
  end
  
  def render
    nav class: "bg-white dark:bg-gray-800 shadow" do
      div class: "container mx-auto px-6 py-3" do
        div class: "md:flex md:items-center md:justify-between" do
          div class: "flex justify-between items-center" do
            div class: "text-xl font-semibold text-gray-700" do
              link "Ask.cr", to: Dashboard::Show, class: "text-gray-800 dark:text-white text-xl font-bold md:text-2xl hover:text-gray-700 dark:hover:text-gray-300"
            end
            div class: "flex md:hidden" do
              button aria_label: "toggle menu", class: "text-gray-500 dark:text-gray-200 hover:text-gray-600 dark:hover:text-gray-400 focus:outline-none focus:text-gray-600 dark:focus:text-gray-400", type: "button" do
                tag "svg", class: "h-6 w-6 fill-current", viewBox: "0 0 24 24" do
                  tag "path", d: "M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z", fill_rule: "evenodd"
                end
              end
            end
          end
          div class: "hidden md:flex md:items-center md:justify-between flex-1" do
            div class: "flex flex-col -mx-4 md:flex-row md:items-center md:mx-8" do
             render_links
            end
            div class: "flex items-center mt-4 md:mt-0" do
              button aria_label: "show notifications", class: "mx-4 hidden md:block text-gray-600 dark:text-gray-200 hover:text-gray-700 dark:hover:text-gray-400 focus:text-gray-700 dark:focus:text-gray-400 focus:outline-none" do
                tag "svg", class: "h-6 w-6", fill: "none", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                  tag "path", d: "M15 17H20L18.5951 15.5951C18.2141 15.2141 18 14.6973 18 14.1585V11C18 8.38757 16.3304 6.16509 14 5.34142V5C14 3.89543 13.1046 3 12 3C10.8954 3 10 3.89543 10 5V5.34142C7.66962 6.16509 6 8.38757 6 11V14.1585C6 14.6973 5.78595 15.2141 5.40493 15.5951L4 17H9M15 17V18C15 19.6569 13.6569 21 12 21C10.3431 21 9 19.6569 9 18V17M15 17H9", stroke: "currentColor", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
              end
              button aria_label: "toggle profile dropdown", class: "flex items-center focus:outline-none", type: "button" do
                div class: "h-8 w-8 overflow-hidden rounded-full border-2  border-gray-400" do
                  if !current_user.profile_picture_path.nil?
                    img alt: "avatar", class: "h-full w-full object-cover", src: current_user.profile_picture_path.not_nil!
                  else
                    img alt: "avatar", class: "h-full w-full object-cover", src: "https://lh3.googleusercontent.com/a-/AOh14Gi0DgItGDTATTFV6lPiVrqtja6RZ_qrY91zg42o-g"
                  end
                end
                h3 "Khatab wedaa", class: "mx-2 text-sm text-gray-700 dark:text-gray-200 font-medium md:hidden"
              end
            end
          end
        end
      end
    end
  end
end

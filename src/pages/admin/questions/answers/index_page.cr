class Admin::Questions::Answers::IndexPage < AdminLayout
  include FormattingHelpers
  needs questions : QuestionQuery
  needs pages : Lucky::Paginator
  quick_def page_title, "All Questions"

  def content
    div class: "container mx-auto mt-2 min-h-screen" do
      div class: "w-full max-w-6xl mx-auto" do
        div class: "grid gap-2 sm:grid-cols-1 md:grid-cols-3 lg:grid-cols-3" do
          div class: "sm:col-span-1 md:col-span-3 align-baseline" do
            h1 "All Questions", class: "text-2xl text-gray-800 font-bold align-baseline"
            small "A list of all questions registered in the application."
          end
          questions_list
        end
      end
    end
  end

  private def questions_list
    div class: "md:col-span-3" do
      div class: "py-4 mb-4 bg-white dark:bg-gray-800 rounded-lg shadow-md" do
        div class: "grid grid-cols-12 border-b-2 border-gray-300" do
          div class: "col-span-1 mb-3 text-center" do
            span "ID", class: "font-bold text-gray-800"
          end
          div class: "col-span-3 mb-3" do
            span "Title", class: "font-bold text-gray-800"
          end
          div class: "col-span-2 mb-3" do
            span "By", class: "font-bold text-gray-800"
          end
          div class: "col-span-2 mb-3" do
            span "Answers", class: "font-bold text-gray-800"
          end
          div class: "has-tooltip inline col-span-1 mb-3 text-center" do
            span "Solved?", class: "font-bold text-gray-800"
          end
          div class: "col-span-3 text-center mb-3 text-center" do
            span "Actions", class: "font-bold text-gray-800"
          end
        end
        questions.each_with_index do |question, index|
          div class: index % 2 == 0 ? "grid grid-cols-16 py-2 bg-gray-50 border-b border-gray-200 hover:bg-gray-100" : "grid grid-cols-16 py-2 bg-white border-b border-gray-200 hover:bg-gray-100" do
            div class: "col-span-1 mb-2 self-center text-center" do
              span question.id, class: "text-gray-800"
            end
            div class: "col-span-3 mb-2 self-center truncate" do
              span question.title, class: "text-gray-800 truncate"
            end
            div class: "col-span-2 mb-2 self-center" do
              span question.author.username, class: "text-gray-800"
            end
            div class: "col-span-2 mb-2 self-center" do
              span question.answers.size, class: "text-gray-800 self-center"
            end
            div class: "col-span-1 text-center mb-2 self-center text-center" do
              if question.solved?
                text "Yes"
              else
                text "No"
              end
            end
            div class: "col-span-3 text-center items-center mb-2 self-center text-center" do
              link to: Admin::Questions::Edit.with(question.id), class: "has-tooltip inline-flex  py-2 px-4 bg-transparent text-gray-800 rounded hover:bg-green-100 focus:outline-none", type: "button" do
                span "Edit this question.", class: "tooltip rounded shadow-lg px-2 py-1 bg-gray-800 text-gray-100 -mt-10"
                tag "svg", class: "inline h-5 w-5 text-gray-700", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                  tag "path", d: "M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
              end
              link to: Admin::Questions::Delete.with(question.id), class: "has-tooltip inline-flex py-2 px-4 bg-transparent text-red-600 rounded hover:bg-red-200 focus:outline-none", type: "button" do
                span "Delete this question.", class: "tooltip rounded shadow-lg px-2 py-1 bg-gray-800 text-gray-100 -mt-8"
                tag "svg", class: "inline h-5 w-5 text-red-500", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                  tag "path", d: "M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                end
              end
            end
          end
        end
      end
      mount ::Shared::PaginationLinks, pages: pages, page_type: "questions"
    end
  end
end
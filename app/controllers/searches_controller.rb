class SearchesController < ApplicationController

  def search
    @model   = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @method, @content)
  end

  private

  def search_for(model, method, content)
    if model == "User"

      if method == "perfect"
        User.where(name: content)

      elsif method == "partial"
        User.where("name LIKE ?", "%#{content}%")

      elsif method == "prefix"
        User.where("name LIKE ?", "#{content}%")

      elsif method == "backward"
        User.where("name LIKE ?", "%#{content}")

      end

    elsif model == "Book"

      if method == "perfect"
        Book.where(title: content)

      elsif method == "partial"
        Book.where("title LIKE ?", "%#{content}%")

      elsif method == "prefix"
        Book.where("title LIKE ?", "#{content}%")

      elsif method == "backward"
        Book.where("title LIKE ?", "%#{content}")

      end

    end
  end

end

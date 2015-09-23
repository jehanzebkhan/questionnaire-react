class Answer < ActiveRecord::Base

  def disabled_text
    disabled? ? "Yes" : "No"
  end
end

# == Schema Information
#
# Table name: teachers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  surname         :string(255)
#  patronymic      :string(255)
#  email           :string(255)
#  birthdate       :date
#  degree          :integer
#  position        :integer
#  status          :integer
#  seniority       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

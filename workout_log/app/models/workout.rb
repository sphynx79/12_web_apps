# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  data       :datetime
#  workout    :string
#  mood       :string
#  length     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Workout < ActiveRecord::Base
   has_many :exercises, dependent: :destroy
end



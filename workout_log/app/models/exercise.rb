# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  name       :string
#  sets       :integer
#  reps       :integer
#  workout_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exercise < ActiveRecord::Base
  belongs_to :workout
end

class CreateJobsSkillsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :jobs, :skills do |t|
      # t.index [:job_id, :skill_id]
      t.index [:skill_id, :job_id], unique: true
    end
  end
end

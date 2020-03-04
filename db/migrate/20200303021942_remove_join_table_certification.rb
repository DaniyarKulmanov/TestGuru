class RemoveJoinTableCertification < ActiveRecord::Migration[6.0]
  def up
    drop_table :certifications, if_exists: true
  end
end

class AddValues < ActiveRecord::Migration
  def change
    Platform.create(:name => "Web App")
    Platform.create(:name => "Iphone App")
    Platform.create(:name => "Android App")

    Role.create(:name => "Developer")
    Role.create(:name => "Designer")
  end
end

class AddAddressTypeToAddresses < ActiveRecord::Migration
  def up
    rename_column :addresses, :type, :address_type
  end

  def down
    rename_column :addresses, :address_type, :type
  end
end

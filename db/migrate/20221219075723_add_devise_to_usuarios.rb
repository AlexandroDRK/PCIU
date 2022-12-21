# frozen_string_literal: true

class AddDeviseToUsuarios < ActiveRecord::Migration[7.0]
  def self.up
    change_table :Usuário do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
    #end

    add_index :Usuário, :email,                unique: true
    add_index :Usuário, :reset_password_token, unique: true
    # add_index :Usuário, :confirmation_token,   unique: true
    # add_index :Usuário, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end

class CreateStructure < ActiveRecord::Migration[6.0]
  def change
	  create_table "expenses", force: :cascade do |t|
	    t.text "name"
	    t.float "amount"
	    t.date "createdAt"
	    t.datetime "created_at", precision: 6, null: false
	    t.datetime "updated_at", precision: 6, null: false
	    t.integer "User_id", null: false
	    t.index ["User_id"], name: "index_expenses_on_User_id"
	  end

	  create_table "group_expenses", force: :cascade do |t|
	    t.datetime "created_at", precision: 6, null: false
	    t.datetime "updated_at", precision: 6, null: false
	    t.integer "Group_id", null: false
	    t.integer "Expense_id", null: false
	    t.index ["Expense_id"], name: "index_group_expenses_on_Expense_id"
	    t.index ["Group_id"], name: "index_group_expenses_on_Group_id"
	  end

	  create_table "groups", force: :cascade do |t|
	    t.string "name"
	    t.text "icon"
	    t.datetime "created_at", precision: 6, null: false
	    t.datetime "updated_at", precision: 6, null: false
	    t.integer "user_id"
	    t.index ["user_id"], name: "index_groups_on_user_id"
	  end

	  create_table "users", force: :cascade do |t|
	    t.string "username", default: "", null: false
	    t.text "userimage"
	    t.datetime "created_at", precision: 6, null: false
	    t.datetime "updated_at", precision: 6, null: false
	    t.string "email", default: "", null: false
	    t.string "encrypted_password", default: "", null: false
	    t.string "reset_password_token"
	    t.datetime "reset_password_sent_at"
	    t.datetime "remember_created_at"
	    t.index ["email"], name: "index_users_on_email", unique: true
	    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
	    t.index ["username"], name: "index_users_on_username", unique: true
	  end

	  add_foreign_key "expenses", "Users"
	  add_foreign_key "group_expenses", "Expenses"
	  add_foreign_key "group_expenses", "Groups"
	  add_foreign_key "groups", "users"
	end
end


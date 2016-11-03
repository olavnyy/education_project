class Superadmin < User
  scope :admins_list, ->(user) { Admin.all }
  scope :schools_list, ->(user) { School.all }
end

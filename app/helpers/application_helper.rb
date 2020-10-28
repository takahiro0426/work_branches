module ApplicationHelper
end
# homes#about時のDeviseのundefined local variable or method `resource_name'対策
def resource_name
   :user
end

def resource
   @resource ||= User.new
end

def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
end
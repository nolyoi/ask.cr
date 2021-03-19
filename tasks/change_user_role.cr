require "../src/app"

class ChangeUserRole < LuckyCli::Task
  summary "Enable or disable an existing user as an admin."

  switch :disable, "Disable an existing user as an admin.", shortcut: "-d"
  positional_arg :email,
    "Email of an existing user."
  positional_arg :role,
    "Desired role."

  def call
    user = UserQuery.new.email(email).first?
    return puts "User #{email} is not found.".colorize(:red) unless user

    case role.downcase
    when "member"
      SaveUser.update!(user, role: User::Role.new(:member))
    when "moderator"
      SaveUser.update!(user, role: User::Role.new(:moderator))
    when "admin"
      SaveUser.update!(user, role: User::Role.new(:admin))
    when "superadmin"
      SaveUser.update!(user, role: User::Role.new(:superadmin))
    else
      raise "invalid role entered."
    end

    if disable?
      previous_role = useer.role
      if user.role.value > 0
        SaveUser.update!(user, role: User::Role.new(:member))
        puts "User #{email} is no longer an admin.".colorize(:green)
      else
        puts "User #{email} is not an admin.".colorize(:red)
      end
    else
      if user.role.value == new_role.value
        puts "User #{email} is already a(n) #{role.downcase}.".colorize(:red)
      else
        SaveUser.update!(user, role: new_role)
        puts "User #{email} is now a(n) #{role.downcase}.".colorize(:green)
      end
    end
  end
end

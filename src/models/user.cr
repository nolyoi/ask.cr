class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable
  include Avram::SoftDelete::Model

  ROLES = [{"Member", User::Role.new(:member)}, {"Moderator", User::Role.new(:moderator)}, {"Admin", User::Role.new(:admin)}, {"Superadmin", User::Role.new(:superadmin)}, {"Banned", User::Role.new(:banned)}]

  table do
    column email : String
    column username : String
    column website_url : String?
    column encrypted_password : String
    column role : User::Role
    column profile_picture_path : String?
    column soft_deleted_at : Time?

    has_many vote_managers : VoteManager
    has_many question_votes : Vote, through: [:vote_managers, :question]
    has_many answer_votes : Vote, through: [:vote_managers, :answer]
    has_many questions : Question, foreign_key: "author_id"
    has_many answers : Answer, foreign_key: "author_id"
  end

  avram_enum Role do
    # Assign custom values
    Member     = 0
    Moderator  = 1
    Admin      = 2
    Superadmin = 3
    Banned     = 4
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end

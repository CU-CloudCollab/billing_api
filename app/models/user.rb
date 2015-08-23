require 'securerandom'

class User < ActiveRecord::Base
  
  before_create :set_auth_token
  has_many :user_account
  
  def admin?
    self.admin
  end
  
  def has_account_access?(account)
    self.user_account.each do |user_account|
      return true if user_account.account_num.eql?(account)
    end
    
    return false
  end

  private
    def set_auth_token
      return if api_key.present?
      self.api_key = generate_auth_token
    end

    def generate_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
  
end

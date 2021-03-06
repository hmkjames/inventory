require 'rubygems'
require 'activeresource'
class UserProfileClient < ActiveResource::Base
  self.site = 'http://salva.fisica.unam.mx/'
  self.element_name = "academic"

  def self.find_by_login(login)
    self.find(167)
  end

  def self.find_by_user_id(id)
     self.find(id)
  end

  def fullname
    @attributes['fullname']
  end

  def adscription_name
    @attributes['adscription']
  end

  def adscription_id
    @attributes['adscription_id']
  end

  def remote_user_id
    @attributes['user_id']
  end

  def phone
    @attributes['phone']
  end

  def email
    @attributes['email']
  end

  def has_user_incharge?
    !@attributes['user_incharge_id'].nil?
  end

  def user_incharge
    UserProfileClient.find_by_user_id(@attributes['user_incharge_id']) if has_user_incharge?
  end
end

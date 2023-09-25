# frozen_string_literal: true

require 'rest-client'


class RemoteRandomUser

  attr_accessor :url, :remote_user

  def initialize(url, remote_user = nil)
    @url = url
    @remote_user = remote_user
  end

  def gather
    RestClient.get(@url)
  end

  def update_local
    newRandomUser = RandomUser.new(@remote_user)
    newRandomUser.save!
  end

end
require 'digest/md5'

module ApplicationHelper

  def gravatar(email,size=128)
    digest = Digest::MD5.hexdigest(email.downcase)
    "<img class='img-rounded' alt='gravatar' src='http://www.gravatar.com/avatar/#{digest}?d=retro&s=#{size}&r=pg' width='#{size}' height='#{size}'/>".html_safe
  end

end

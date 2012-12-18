require 'digest/md5'

module ApplicationHelper

  def gravatar(email,size=128)
    digest = Digest::MD5.hexdigest(email.downcase)
    "<img class='img-rounded' alt='gravatar' src='http://www.gravatar.com/avatar/#{digest}?d=retro&s=#{size}&r=pg' width='#{size}' height='#{size}'/>".html_safe
  end

  def control_group(form,field,icon = nil)
    if block_given?
      input = yield 
    else
      input = form.text_field field, { :for => field }
    end

    content_tag :div, :class => 'control-group' do
      form.label(field, { :class => 'control-label', :for => field }) +
      content_tag(:div, :class => 'controls') do
        if icon
          content_tag(:div, :class => 'input-prepend') do
            content_tag(:span, :class => 'add-on') do
              content_tag(:i, '', :class => icon)
            end +
            input
          end  
        else
          input
        end
      end
    end
  end

end

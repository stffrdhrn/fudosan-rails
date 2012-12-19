require 'digest/md5'

module ApplicationHelper

  def gravatar(email,size=128)
    digest = Digest::MD5.hexdigest(email.downcase)
    "<img class='img-rounded' alt='gravatar' src='http://www.gravatar.com/avatar/#{digest}?d=retro&s=#{size}&r=pg' width='#{size}' height='#{size}'/>".html_safe
  end

  def control_group(form,field, opt = {})
    if block_given?
      input = yield 
    else
      input = form.text_field field, { :for => field }
    end

    if opt.include? :msg
      input = input + opt[:msg]
    end

    if opt.include? :help
      input = input + 
      content_tag(:span, opt[:help], :class => 'help-block')
    end

    content_tag :div, :class => 'control-group' do
      form.label(field, { :class => 'control-label', :for => field }) +
      content_tag(:div, :class => 'controls') do
        if opt[:icon]
          content_tag(:div, :class => 'input-prepend') do
            content_tag(:span, :class => 'add-on') do
              content_tag(:i, '', :class => opt[:icon])
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

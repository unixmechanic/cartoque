# encoding: utf-8
module MachinesHelper
  def maintenance_limit(date)
    return content_tag(:span, "non", :class => "maintenance-critical") if date.blank?
    months_before_end = ((date - Date.today) / 30).to_f
    if months_before_end <= 6
      content_tag(:span, l(date), :class => "maintenance-critical")
    elsif months_before_end <= 12
      content_tag(:span, l(date), :class => "maintenance-warning")
    else
      l(date)
    end
  end

  def render_mainteneur(machine, mainteneur)
    return "" unless mainteneur
    html =  "#{link_to mainteneur, mainteneur} "
    html << link_to_function("[infos]", %[$("#maintenance-#{machine.id}").slideToggle(130); return false;],
                             :class => "mainteneur-infos hide-when-print")
    html << " "
    html << " - #{machine.contract_type}" if machine.contract_type?
    html << %(<ul style="display:none" class="mainteneur" id="maintenance-#{machine.id}">)
    html << %(<li>Référence client: #{mainteneur.client_ref}</li>)
    html << %(<li>Téléphone: #{mainteneur.phone}</li>)
    html << %(<li>Mail: #{mail_to mainteneur.email}</li>)
    html << %(<li>Adresse: #{mainteneur.address}</li>)
    html << "</ul>"
    html.html_safe
  end
end

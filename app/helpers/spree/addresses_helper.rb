module Spree::AddressesHelper
  def address_field(form, method, id_prefix = "b", &handler)
    id_prefix = id_prefix == 'bill_address' ? 'b' : 's'
    content_tag :p, :id => [id_prefix, method].join, :class => "field" do
      if handler
        handler.call
      else
        is_required = Spree::Address.required_fields.include?(method) || (method == :phone && form.object.phone_required?)
        separator = is_required ? '<span class="req">*</span><br />' : '<br />'
        form.label(method) + separator.html_safe +
        form.text_field(method, {:class => (is_required ? 'required' : nil)}.merge(autocomplete_attribute(method)))
      end
    end
  end

  def address_state(form, country)
    country ||= Spree::Country.find(Spree::Config[:default_country_id])
    have_states = !country.states.empty?
    state_elements = [
      form.collection_select(:state_id, country.states.order(:name),
                            :id, :name,
                            {:include_blank => true},
                            {:class => have_states ? "required" : "hidden",
                            :disabled => !have_states}.merge(autocomplete_attribute(:state_id))) +
      form.text_field(:state_name,
                      {:class => !have_states ? "required" : "hidden",
                      :disabled => have_states}.merge(autocomplete_attribute(:state_id)))
      ].join.gsub('"', "'").gsub("\n", "")

    form.label(:state, Spree.t(:state)) + '<span class="req">*</span><br />'.html_safe +
      content_tag(:noscript, form.text_field(:state_name, :class => 'required')) +
      javascript_tag("document.write(\"#{state_elements.html_safe}\");")
  end

  # Please refer to address_fields initializer for more details
  # on the implementation and values of autocomplete fields
  def autocomplete_attribute(name)
    value = AUTOCOMPLETE[name]
    if value.present?
      {:autocomplete => value, "x-autocompletetype" => value}
    end
  end
end

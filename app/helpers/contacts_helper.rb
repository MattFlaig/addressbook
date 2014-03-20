module ContactsHelper

  def back_to_contact_list
	  content_tag(:p,
	    link_to("Back to index", contacts_path),
	    class: "btn btn-large btn-info")
  end

end

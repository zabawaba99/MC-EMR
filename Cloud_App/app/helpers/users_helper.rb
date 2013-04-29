
  # Copyright ©  Mobile Clinic-Electronic Medical Records.
  #   Permission is granted to copy, distribute and/or modify this document
  #   under the terms of the GNU Free Documentation License, Version 1.3
  #   or any later version published by the Free Software Foundation;
  #   with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  #   A copy of the license is included in the section entitled "GNU
  #   Free Documentation License".
module UsersHelper

    def type_of_user(type)
      if(type == 0)
        "Admin"
      elsif(type == 1)
      "Record Keeper"
    end
  end


  def status(type)
    if(type == 1)
      "Active"
  else
    "Inactive"
  end
end
end

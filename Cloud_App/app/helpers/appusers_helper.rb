
  # Copyright ©  Mobile Clinic-Electronic Medical Records.
  #   Permission is granted to copy, distribute and/or modify this document
  #   under the terms of the GNU Free Documentation License, Version 1.3
  #   or any later version published by the Free Software Foundation;
  #   with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  #   A copy of the license is included in the section entitled "GNU
  #   Free Documentation License".

module AppusersHelper

    def type_of_appuser(type)
      if(type == 0)
        "Nurse"
      elsif(type == 1)
        "Doctor"
     elsif(type == 2)
      "Pharmacist"
        elsif(type == 3)
      "App Admin"
    end
  end

    def admin_user?
    current_user.userType == 0
  end

end



  # Copyright ©  Mobile Clinic-Electronic Medical Records.
  #   Permission is granted to copy, distribute and/or modify this document
  #   under the terms of the GNU Free Documentation License, Version 1.3
  #   or any later version published by the Free Software Foundation;
  #   with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  #   A copy of the license is included in the section entitled "GNU
  #   Free Documentation License".
class Visit < ActiveRecord::Base

  attr_accessible   :bloodPressure, :conditions, :observation, :docterOut, :doctorId, 
                    :doctorIn, :doctorOut, :nurseId, :patientId, :triageIn, :triageOut, 
                    :weight, :diagnosisTitle, :heartRate, :respiration, :visitationId
  
  set_primary_key   :visitationId  
  belongs_to :patient, :foreign_key => 'patientId'
  belongs_to :user
  
  has_one :prescription
     
  end
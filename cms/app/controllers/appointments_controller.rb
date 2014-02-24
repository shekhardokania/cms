class AppointmentsController < ApplicationController

  def index
   @appointments = Appointment.all
   @appointment = Appointment.new
  end

  def patient_name_for_autocomplete
    render :json => Patient.where("name like ? && doctor_id = ?", "%#{params[:term]}%",current_user.id).map {|x| {:label => x.name,:value => x.name,:id => x.id }}
  end

  def new
    @appointment = Appointment.new
  end

  def create
   new_patient = Patient.create(:name => params[:patient_name],:doctor_id => current_user.id)   if params[:patient_id].blank?
   appointment = Appointment.new(:user_id => current_user.id,:patient_id => params[:patient_id] || new_patient.id,:start_time => params[:start_date],:end_time => params[:end_date],:allday => params[:allday],:title => params[:patient_name])
   if appointment.save
     redirect_to :back, notice: "Appointment created successfully.#{' Please complete the patient profile.' if new_patient}" and return
   else
     format.html { redirect_to :back, notice: appointment.errors.full_messages.join("</br>") }
   end
  end

  def get_appointments
    #appointments = Appointment.all
    render :json => Appointment.all.map {|a| {:id => a.id,:title => a.title,:start => a.start_time.to_i,:end => a.end_time.to_i,:allDay => false}}
  end

end

class AppointmentsController < ApplicationController

  def index
   @appointments = Appointment.all
   @appointment = Appointment.new
  end

  def patient_name_for_autocomplete
    render :json => current_user.patients.where("name like ? ", "%#{params[:term]}%").map {|x| {:label => x.name,:value => x.name,:id => x.id }}
  end

  def new
    @appointment = Appointment.new
  end

  def show
    appointment = Appointment.find(params[:id])
    doctor = appointment.doctor
    patient = appointment.patient
  end

  def reschedule
     apt = Appointment.find(params[:event][:id])
     if apt.update_attributes(:start_time => params[:event][:start],:end_time => params[:event][:end],:allday => params[:event][:allDay])
       render :json => { :success => true } and return
     else
       render :json => { :success => false } and return
     end
  end

  def create
   new_patient = Patient.create(:name => params[:patient_name])   if params[:patient_id].blank?
   appointment = Appointment.new(:doctor_id => current_user.id,:patient_id => params[:patient_id] ,:start_time => params[:start_date],:end_time => params[:end_date],:allday => params[:allday],:title => params[:patient_name])
   appointment.patient_id = new_patient.id if params[:patient_id].blank?
   if appointment.save
     redirect_to :back, notice: "Appointment created successfully.#{' Please complete the patient profile.' if new_patient}" and return
   else
     format.html { redirect_to :back, notice: appointment.errors.full_messages.join("</br>") }
   end
  end

  def get_appointments
    #appointments = Appointment.all
    render :json => current_user.appointments.map {|a| {:id => a.id,:title => a.title,:start => a.start_time.to_i,:end => a.end_time.to_i,:allDay => false,:type => 'follow up',:url => url_for(a)}}
  end

end

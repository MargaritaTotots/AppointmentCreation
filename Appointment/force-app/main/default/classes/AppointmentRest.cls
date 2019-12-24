@RestResource(urlMapping = '/appointments/*')
public with sharing class AppointmentRest {

    @HttpPost
    global static String doPost(Appointment__c appointment){
        Map<String,  object> responseBody = new Map<String, Object>{
                'id' => '',
                'success' => true,
                'errors' => new List<String>()
                };
        try{
            insert appointment;
            responseBody.put('id', appointment.Id);
        }catch(Exception ex){
            responseBody.put('success', false);
            List<String> errors = (List<String>)responseBody.get('errors');
            errors.add(ex.getMessage());
        }
        return JSON.serialize(responseBody);
    } 
}

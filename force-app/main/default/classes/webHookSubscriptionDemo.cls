@RestResource(urlMapping='/api/Webhooks/pushDetailsdemo/*')
global with sharing class webHookSubscriptionDemo {
    
    @HttpPost
    global static void handleNotification(){
        try{
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            System.debug(request);
            System.debug(request);
            String hasdhedVal = request.headers.get('X-Hub0Signature-256');
            System.debug(hasdhedVal);
            System.debug(request.requestBody.toString());
        }
        catch(Exception e){
            System.debug('Exception Happened'+e.getMessage());
        }
    }

    //adasd1231

}
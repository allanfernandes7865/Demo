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

            JSONParser parser = JSON.createParser(request.requestBody.toString());
            
            pusher ps;
            String repo;

            while(parser.nextToken()!=null){
                System.debug(parser.getText());
                if(parser.getText()=='pusher'){
                    System.debug('Inside Pusher');
                    parser.nextToken();
                    ps = (pusher)parser.readValueAs(pusher.class);
                    System.debug(ps);
                }
            }
            GitHub_PushDetails__c detail = new 	GitHub_PushDetails__c();
            detail.Name = ps.name;
            detail.Commiter_Email__c = ps.email;
    
            insert detail;
            response.statusCode = 200;
        }
        catch(Exception e){
            System.debug('Exception Happened'+e.getMessage());
        }

       
    }

    //adasd1231311123

    public class pusher{
        public String name;
        public String email;

        public pusher(String name,String email){
            name  = name;
            email  = email;
        }
    }

}